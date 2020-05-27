//
//  RootViewController.h
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class RootViewController;
@protocol GFRootViewControllerDelegate <NSObject>
@optional
/** Informs the delegate that the user selected view controller by tapping the corresponding icon.
 @note The method is called regardless of whether the selected view controller changed or not and only as a result of the user tapped a button. The method is not called when the view controller is changed programmatically. This is the same pattern as UITabBarController uses.
 */
- (void)containerViewController:(RootViewController *)containerViewController didSelectViewController:(UIViewController *)viewController;

/// Called on the delegate to obtain a UIViewControllerAnimatedTransitioning object which can be used to animate a non-interactive transition.
- (id <UIViewControllerAnimatedTransitioning>)containerViewController:(RootViewController *)containerViewController animationControllerForTransitionFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController;
@end



@interface RootViewController : BaseViewController

/// The view controllers currently managed by the container view controller.
@property (nonatomic, strong) NSMutableArray<__kindof UIViewController *> *viewControllers;

/// The currently selected and visible child view controller.
@property (nonatomic, assign,readonly) UIViewController *selectedViewController;

/** Designated initializer.
 @note The view controllers array cannot be changed after initialization.
 */
- (instancetype)initWithViewControllers:(NSArray *)viewControllers;


- (void)switchToViewController:(NSUInteger)index withCompletionBlock:(void(^)(void)) completion;

@end

NS_ASSUME_NONNULL_END
