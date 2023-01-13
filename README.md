# UITableView_Invalid_Number



# Crash
## _Bug_Detected_In_Client_Of_UITableView_Invalid_Number_Of_Sections
```
2023-01-13 18:58:26.257486+0800 UITableView_Invalid_Number[94395:18738936] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Invalid update: invalid number of sections. The number of sections contained in the table view after the update (0) must be equal to the number of sections contained in the table view before the update (1), plus or minus the number of sections inserted or deleted (0 inserted, 0 deleted). Table view: <UITestTableView: 0x7fd46e80de00; baseClass = UITableView; frame = (0 106; 393 746); clipsToBounds = YES; gestureRecognizers = <NSArray: 0x600000e1f390>; backgroundColor = <UIDynamicSystemColor: 0x600001578540; name = tableBackgroundColor>; layer = <CALayer: 0x600000026220>; contentOffset: {0, 0}; contentSize: {393, 132}; adjustedContentInset: {0, 0, 34, 0}; dataSource: <ViewController: 0x7fd47df07ed0>>'
*** First throw call stack:
(
	0   CoreFoundation                      0x000000010bea4378 __exceptionPreprocess + 242
	1   libobjc.A.dylib                     0x000000010aef0baf objc_exception_throw + 48
	2   Foundation                          0x000000010e3926ac _userInfoForFileAndLine + 0
	3   UIKitCore                           0x0000000119cc76cd -[UITableView _Bug_Detected_In_Client_Of_UITableView_Invalid_Number_Of_Sections:] + 115
	4   UIKitCore                           0x0000000119cc6592 -[UITableView _endCellAnimationsWithContext:] + 13740
	5   UIKitCore                           0x0000000119ce1837 -[UITableView endUpdatesWithContext:] + 116
	6   UITableView_Invalid_Number          0x00000001024ae715 -[ViewController testAction] + 309
	7   UIKitCore                           0x0000000119a7eabf -[UIApplication sendAction:to:from:forEvent:] + 95
	8   UIKitCore                           0x00000001191e9723 -[UIControl sendAction:to:forEvent:] + 110
	9   UIKitCore                           0x00000001191e9b27 -[UIControl _sendActionsForEvents:withEvent:] + 345
	10  UIKitCore                           0x00000001191e5c47 -[UIButton _sendActionsForEvents:withEvent:] + 148
	11  UIKitCore                           0x00000001191e837e -[UIControl touchesEnded:withEvent:] + 485
	12  UIKitCore                           0x0000000119ac3d0d -[UIWindow _sendTouchesForEvent:] + 1292
	13  UIKitCore                           0x0000000119ac5d69 -[UIWindow sendEvent:] + 5304
	14  UIKitCore                           0x0000000119a99526 -[UIApplication sendEvent:] + 898
	15  UIKitCore                           0x0000000119b40444 __dispatchPreprocessedEventFromEventQueue + 9383
	16  UIKitCore                           0x0000000119b42b61 __processEventQueue + 8355
	17  UIKitCore                           0x0000000119b38fc4 __eventFetcherSourceCallback + 272
	18  CoreFoundation                      0x000000010be03ebd __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 17
	19  CoreFoundation                      0x000000010be03dfc __CFRunLoopDoSource0 + 157
	20  CoreFoundation                      0x000000010be035f9 __CFRunLoopDoSources0 + 212
	21  CoreFoundation                      0x000000010bdfddb3 __CFRunLoopRun + 927
	22  CoreFoundation                      0x000000010bdfd637 CFRunLoopRunSpecific + 560
	23  GraphicsServices                    0x0000000111b0628a GSEventRunModal + 139
	24  UIKitCore                           0x0000000119a78425 -[UIApplication _run] + 994
	25  UIKitCore                           0x0000000119a7d301 UIApplicationMain + 123
	26  UITableView_Invalid_Number          0x00000001024af9e6 main + 118
	27  dyld                                0x000000010ac4b2bf start_sim + 10
	28  ???                                 0x00000002026ba52e 0x0 + 8630543662
	29  ???                                 0x0000000000000003 0x0 + 3
)
libc++abi: terminating with uncaught exception of type NSException
*** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Invalid update: invalid number of sections. The number of sections contained in the table view after the update (0) must be equal to the number of sections contained in the table view before the update (1), plus or minus the number of sections inserted or deleted (0 inserted, 0 deleted). Table view: <UITestTableView: 0x7fd46e80de00; baseClass = UITableView; frame = (0 106; 393 746); clipsToBounds = YES; gestureRecognizers = <NSArray: 0x600000e1f390>; backgroundColor = <UIDynamicSystemColor: 0x600001578540; name = tableBackgroundColor>; layer = <CALayer: 0x600000026220>; contentOffset: {0, 0}; contentSize: {393, 132}; adjustedContentInset: {0, 0, 34, 0}; dataSource: <ViewController: 0x7fd47df07ed0>>'
terminating with uncaught exception of type NSException
CoreSimulator 857.7 - Device: iPhone 14 Pro (0C40210D-370E-42D0-B304-BD00A3C15652) - Runtime: iOS 16.0 (20A360) - DeviceType: iPhone 14 Pro
```


## _Bug_Detected_In_Client_Of_UITableView_Invalid_Number_Of_Rows_In_Section
```
2023-01-13 18:56:58.203697+0800 UITableView_Invalid_Number[93178:18733023] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Invalid update: invalid number of rows in section 0. The number of rows contained in an existing section after the update (6) must be equal to the number of rows contained in that section before the update (3), plus or minus the number of rows inserted or deleted from that section (0 inserted, 0 deleted) and plus or minus the number of rows moved into or out of that section (0 moved in, 0 moved out). Table view: <UITestTableView: 0x7fbab5827200; baseClass = UITableView; frame = (0 106; 393 746); clipsToBounds = YES; gestureRecognizers = <NSArray: 0x600002403bd0>; backgroundColor = <UIDynamicSystemColor: 0x600003f60a00; name = tableBackgroundColor>; layer = <CALayer: 0x600002a48680>; contentOffset: {0, 0}; contentSize: {393, 132}; adjustedContentInset: {0, 0, 34, 0}; dataSource: <ViewController: 0x7fbab4b08c70>>'
*** First throw call stack:
(
	0   CoreFoundation                      0x000000010e4a0378 __exceptionPreprocess + 242
	1   libobjc.A.dylib                     0x000000010d4ecbaf objc_exception_throw + 48
	2   Foundation                          0x000000011098e6ac _userInfoForFileAndLine + 0
	3   UIKitCore                           0x000000011c2c3767 -[UITableView _Bug_Detected_In_Client_Of_UITableView_Invalid_Number_Of_Rows_In_Section:] + 115
	4   UIKitCore                           0x000000011c2c2d9e -[UITableView _endCellAnimationsWithContext:] + 15800
	5   UIKitCore                           0x000000011c2dd837 -[UITableView endUpdatesWithContext:] + 116
	6   UITableView_Invalid_Number          0x0000000104aa9715 -[ViewController testAction] + 341
	7   UIKitCore                           0x000000011c07aabf -[UIApplication sendAction:to:from:forEvent:] + 95
	8   UIKitCore                           0x000000011b7e5723 -[UIControl sendAction:to:forEvent:] + 110
	9   UIKitCore                           0x000000011b7e5b27 -[UIControl _sendActionsForEvents:withEvent:] + 345
	10  UIKitCore                           0x000000011b7e1c47 -[UIButton _sendActionsForEvents:withEvent:] + 148
	11  UIKitCore                           0x000000011b7e437e -[UIControl touchesEnded:withEvent:] + 485
	12  UIKitCore                           0x000000011c0bfd0d -[UIWindow _sendTouchesForEvent:] + 1292
	13  UIKitCore                           0x000000011c0c1d69 -[UIWindow sendEvent:] + 5304
	14  UIKitCore                           0x000000011c095526 -[UIApplication sendEvent:] + 898
	15  UIKitCore                           0x000000011c13c444 __dispatchPreprocessedEventFromEventQueue + 9383
	16  UIKitCore                           0x000000011c13eb61 __processEventQueue + 8355
	17  UIKitCore                           0x000000011c134fc4 __eventFetcherSourceCallback + 272
	18  CoreFoundation                      0x000000010e3ffebd __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 17
	19  CoreFoundation                      0x000000010e3ffdfc __CFRunLoopDoSource0 + 157
	20  CoreFoundation                      0x000000010e3ff5f9 __CFRunLoopDoSources0 + 212
	21  CoreFoundation                      0x000000010e3f9db3 __CFRunLoopRun + 927
	22  CoreFoundation                      0x000000010e3f9637 CFRunLoopRunSpecific + 560
	23  GraphicsServices                    0x000000011410228a GSEventRunModal + 139
	24  UIKitCore                           0x000000011c074425 -[UIApplication _run] + 994
	25  UIKitCore                           0x000000011c079301 UIApplicationMain + 123
	26  UITableView_Invalid_Number          0x0000000104aaa9e6 main + 118
	27  dyld                                0x000000010d2462bf start_sim + 10
	28  ???                                 0x0000000204d5452e 0x0 + 8671020334
	29  ???                                 0x0000000000000003 0x0 + 3
)
libc++abi: terminating with uncaught exception of type NSException
*** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Invalid update: invalid number of rows in section 0. The number of rows contained in an existing section after the update (6) must be equal to the number of rows contained in that section before the update (3), plus or minus the number of rows inserted or deleted from that section (0 inserted, 0 deleted) and plus or minus the number of rows moved into or out of that section (0 moved in, 0 moved out). Table view: <UITestTableView: 0x7fbab5827200; baseClass = UITableView; frame = (0 106; 393 746); clipsToBounds = YES; gestureRecognizers = <NSArray: 0x600002403bd0>; backgroundColor = <UIDynamicSystemColor: 0x600003f60a00; name = tableBackgroundColor>; layer = <CALayer: 0x600002a48680>; contentOffset: {0, 0}; contentSize: {393, 132}; adjustedContentInset: {0, 0, 34, 0}; dataSource: <ViewController: 0x7fbab4b08c70>>'
terminating with uncaught exception of type NSException
CoreSimulator 857.7 - Device: iPhone 14 Pro (0C40210D-370E-42D0-B304-BD00A3C15652) - Runtime: iOS 16.0 (20A360) - DeviceType: iPhone 14 Pro
```
