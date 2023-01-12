//
//  ViewController.m
//  UITableView_Invalid_Number
//
//  Created by zhuruhong on 2023/1/12.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>

@interface UITestTableView : UITableView

@end

@implementation UITestTableView

//- (void)_Bug_Detected_In_Client_Of_UITableView_Invalid_Number_Of_Sections:(NSInteger)sections
//{
//    NSLog(@" ----> [section] bug: %@", @(sections));
//}
//
//- (void)_Bug_Detected_In_Client_Of_UITableView_Invalid_Number_Of_Rows_In_Section:(NSInteger)rows
//{
//    NSLog(@" ----> [row] bug: %@", @(rows));
//}

@end

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UIButton *crashButton;
@property (nonatomic, strong) UIButton *testButton;
@property (nonatomic, strong) UIButton *bugfixButton;

@property (nonatomic, assign) NSInteger sectionCount;
@property (nonatomic, assign) NSInteger rowInSectionCount;
@property (nonatomic, strong) UITestTableView *tableView;

@property (nonatomic, assign) NSInteger lastSectionCount;
@property (nonatomic, assign) NSInteger lastRowCount;
@property (nonatomic, strong) NSMutableDictionary *lastRowCountInSectionDic;

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    
    self.crashButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.crashButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.crashButton setTitle:@"crash button" forState:UIControlStateNormal];
    [self.crashButton addTarget:self action:@selector(crashAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.crashButton];
    [self.crashButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view).offset(10);
        make.top.equalTo(self.view).offset(60);
        make.size.mas_equalTo(CGSizeMake(110, 40));
    }];
    
    self.testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.testButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.testButton setTitle:@"test button" forState:UIControlStateNormal];
    [self.testButton addTarget:self action:@selector(testAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.testButton];
    [self.testButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.crashButton.mas_trailing).offset(10);
        make.centerY.equalTo(self.crashButton);
        make.size.mas_equalTo(CGSizeMake(110, 40));
    }];
    
    self.bugfixButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bugfixButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.bugfixButton setTitle:@"bugfix button" forState:UIControlStateNormal];
    [self.bugfixButton addTarget:self action:@selector(bugfixAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.bugfixButton];
    [self.bugfixButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.testButton.mas_trailing).offset(10);
        make.centerY.equalTo(self.testButton);
        make.size.mas_equalTo(CGSizeMake(110, 40));
    }];
    
    self.sectionCount = 1;
    self.rowInSectionCount = 3;
    self.lastRowCountInSectionDic = @{}.mutableCopy;
    
    self.tableView = [[UITestTableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.top.equalTo(self.crashButton.mas_bottom).offset(6);
        make.bottom.equalTo(self.view);
    }];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)crashAction
{
    self.sectionCount = random() % 3;
    self.rowInSectionCount = random() % 8;
    
    NSLog(@" ----> begin updates sectionCount: %@, rowCount: %@", @(self.sectionCount), @(self.rowInSectionCount));
    
    //case 1
    [self.tableView beginUpdates];
    //没有操作 tableView insert/delete/move/reloadRows 导致 数量不匹配 crash
    [self.tableView endUpdates];
    
    //case 2
//    [self.tableView performBatchUpdates:^{
//        [self.tableView reloadData];
//    } completion:^(BOOL finished) {
//        NSLog(@"finished");
//    }];
}

- (void)testAction
{
    self.sectionCount = random() % 3;
    self.rowInSectionCount = random() % 8;
    
    //数量不匹配时，强制刷新
    if (self.lastSectionCount != self.sectionCount) {
        [self.tableView reloadData];
        NSLog(@" ----> [section] reload data: %@", @(self.sectionCount));
    } else {
        for (NSInteger i=0; i<self.sectionCount; i++) {
            NSInteger lastRowCount = [self.lastRowCountInSectionDic[@(i)] integerValue];
            NSLog(@" ----> lastRowCount: %@, rowCount: %@", @(lastRowCount), @(self.rowInSectionCount));
            if (lastRowCount != self.rowInSectionCount) {
                [self.tableView reloadData];
                NSLog(@" ----> [row] reload data: %@", @(self.rowInSectionCount));
                break;
            } else if (self.lastRowCount != self.rowInSectionCount) {
                [self.tableView reloadData];
                NSLog(@" ----> [row] reload data: %@", @(self.rowInSectionCount));
                break;
            }
        }
    }
    
    NSLog(@" ----> begin updates sectionCount: %@, rowCount: %@", @(self.sectionCount), @(self.rowInSectionCount));
    [self.tableView beginUpdates];
    
    //操作 tableView insert/delete/move/reloadRows
    
    [self.tableView endUpdates];
    NSLog(@" ----> end updates last sectionCount: %@, last rowCount: %@, dic: %@", @(self.lastSectionCount), @(self.lastRowCount), self.lastRowCountInSectionDic);
}

- (void)bugfixAction
{
    self.sectionCount = random() % 3;
    self.rowInSectionCount = random() % 8;
    
    //数量不匹配时，强制刷新
    if (self.lastSectionCount != self.sectionCount) {
        [self.tableView reloadData];
        NSLog(@" ----> [section] reload data: %@", @(self.sectionCount));
        return;
    }
    
    //计算变化后的数据 diff
    NSInteger rowDiff = self.rowInSectionCount - self.lastRowCount;
    
    NSLog(@" ----> begin updates sectionCount: %@, rowCount: %@, last data: %@", @(self.sectionCount), @(self.rowInSectionCount), self.lastRowCountInSectionDic);
    [self.lastRowCountInSectionDic removeAllObjects];
    [self.tableView beginUpdates];
    
    //TODO: 操作 tableView insert/delete/move/reloadRows
    if (rowDiff < 0) {
        for (NSInteger i=0; i<self.sectionCount; i++) {
            for (NSInteger j=0; j<(-rowDiff); j++) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:j inSection:i];
                [self.tableView deleteRowsAtIndexPaths:@[ indexPath ]
                            withRowAnimation:UITableViewRowAnimationFade];
                NSLog(@" ----> delete section: %@, row: %@", @(i), @(j));
            }
        }
    } else {
        for (NSInteger i=0; i<self.sectionCount; i++) {
            for (NSInteger j=0; j<rowDiff; j++) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:j inSection:i];
                [self.tableView insertRowsAtIndexPaths:@[ indexPath ]
                            withRowAnimation:UITableViewRowAnimationFade];
                NSLog(@" ----> insert section: %@, row: %@", @(i), @(j));
            }
        }
        
    }
    
    [self.tableView endUpdates];
    NSLog(@" ----> end updates last sectionCount: %@, last rowCount: %@, now data: %@", @(self.lastSectionCount), @(self.lastRowCount), self.lastRowCountInSectionDic);
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    self.lastSectionCount = self.sectionCount;
    NSLog(@"----> sectionCount: %@", @(self.lastSectionCount));
    return self.lastSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger lastRowCount = self.rowInSectionCount;
    self.lastRowCount = lastRowCount;
    self.lastRowCountInSectionDic[@(section)] = @(lastRowCount);
    NSLog(@"----> section: %@, rowCount: %@", @(section), @(lastRowCount));
    return self.lastRowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"sample text %@", @(indexPath.row)];
    return cell;
}

#pragma mark - UITableViewDelegate

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 40;
//}

@end
