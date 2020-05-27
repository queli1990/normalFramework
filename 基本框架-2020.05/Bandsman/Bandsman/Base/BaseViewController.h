//
//  BaseViewController.h
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^BMCloseBlock)(void);


@interface BaseViewController : UIViewController

/** 页面关闭的回调 */
@property (nonatomic, copy) BMCloseBlock pageCloseBlock;

/** 执行pageCloseBlock 事件 */
- (void)closeCurrentPage;
- (void)showAutoDismissTextAlert:(NSString *)alert;
- (void)showWaitingHUD;
- (void)hideWaitingHUD;

- (void) showWaitingHUDWithPartView:(UIView *)tempView;

@end

NS_ASSUME_NONNULL_END
