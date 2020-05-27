//
//  BaseViewController.m
//  Bandsman
//
//  Created by li que on 2020/5/26.
//  Copyright © 2020 UU. All rights reserved.
//

#import "BaseViewController.h"
#import "NavigationBar.h"
#import "MBProgressHUD.h"
#import "OVKeepBGRunManager.h"


@interface BaseViewController ()
@property (nonatomic, strong)MBProgressHUD *hud;

///** 开屏广告 */
//@property (nonatomic, strong) GADAppOpenAd *googleOpenAd;
///** 开屏广告页面 */
//@property (nonatomic, strong) GADAppOpenAdView *googleOpenAdView;
//
//@property (nonatomic, strong) UIImageView *backgroundImageView;
//
//@property (nonatomic, strong) UIImageView *logoImageView;
//
//@property (nonatomic, strong) OVOpenAdFBNavtiveAd *fbOpenAdView;
//
//@property (nonatomic, strong) OVADModel *openAd;
//
//@property (nonatomic, assign) BOOL facebookIsSuccess;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addObserver];
}

- (void)addObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationEnterBackground)
                                                 name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
}


- (void)applicationEnterBackground {

//    if (ULConfigIsAudit) {
//        AVAudioSession *session = [AVAudioSession sharedInstance];
//        [session setActive:YES error:nil];
//        [session setCategory:AVAudioSessionCategoryPlayback error:nil];
//        //让 app 支持接受远程控制事件
//        [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
//
//        //播放背景音乐
//        NSString *musicPath=[[NSBundle mainBundle] pathForResource:@"audio" ofType:@"mp3"];
//        NSURL *url=[[NSURL alloc]initFileURLWithPath:musicPath];
//        //创建播放器
//        AVAudioPlayer *audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
//
//        [audioPlayer prepareToPlay];
//
//        //无限循环播放
//        audioPlayer.numberOfLoops=-1;
//        [audioPlayer play];
//    }
    
    
//    [[OVKeepBGRunManager shareManager] startBGRun];
    NSLog(@"进入后台");
    

//    self.googleOpenAd = nil;
//
//    self.facebookIsSuccess = NO;
//
//    OVADModel *openAd = [OVADInfo getOpenAd];
//
//    self.openAd = openAd;
//
//    if (openAd) {
//
//        if (openAd.channel == GoogleAd) {
//            GADRequest *request = [GADRequest request];
//            //如果是开发阶段，需要填写测试手机的UUID，不填写可能会误会你自己刷展示量
//#ifdef DEBUG
//            request.testDevices = @[@"26e6eebe4bf436ab37961659aa3fe784"];
//
//#else
//
//#endif
//            [GADAppOpenAd loadWithAdUnitID:openAd.position
//                                   request:request
//                               orientation:UIInterfaceOrientationPortrait
//                         completionHandler:^(GADAppOpenAd *_Nullable appOpenAd, NSError *_Nullable error) {
//                             if (error) {
//                                 NSLog(@"Failed to load app open ad: %@", error);
//                                 return;
//                             }
//                             self.googleOpenAd = appOpenAd;
//                         }];
//        } else {
//            self.fbOpenAdView = [[OVOpenAdFBNavtiveAd alloc] initWithRootViewController:self];
//            @weakify(self)
//            [self.fbOpenAdView loadOpenAdWithAdModel:openAd resultBlock:^(BOOL isSuccess) {
//                weak_self.facebookIsSuccess = isSuccess;
//            }];
//            self.fbOpenAdView.closeBlock = ^{
//                [[AppDelegate instance] switchNextRootViewController];
//            };
//        }
//
//    }
}

- (void)applicationEnterForeground {
//    if (ULConfigIsAudit) {
//        [self.audioPlayer stop];
//        self.audioPlayer = nil;
//    }
    
//    [[OVKeepBGRunManager shareManager] stopBGRun];
    NSLog(@"进入前台");
    
//    if (self.openAd.channel == GoogleAd) {
//        if (self.googleOpenAd) {
//
//            [self.backgroundImageView removeFromSuperview];
//            [self.logoImageView removeFromSuperview];
//            [self.googleOpenAdView removeFromSuperview];
//
//            @weakify(self);
//            self.googleOpenAdView = [[GADAppOpenAdView alloc] init];
//            self.googleOpenAdView.adCloseHandler = ^{
//                [weak_self.backgroundImageView removeFromSuperview];
//                [weak_self.logoImageView removeFromSuperview];
//            };
//            [kOVWindow addSubview:self.googleOpenAdView];
//            [self.googleOpenAdView makeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(20);
//                make.left.right.equalTo(0);
//            }];
//
//            self.googleOpenAdView.appOpenAd = self.googleOpenAd;
//
//            [kOVWindow addSubview:self.backgroundImageView];
//            [self.backgroundImageView makeConstraints:^(MASConstraintMaker *make) {
//                make.left.right.bottom.equalTo(0);
//            }];
//
//            [self.backgroundImageView addSubview:self.logoImageView];
//            [self.logoImageView makeConstraints:^(MASConstraintMaker *make) {
//                make.center.equalTo(0);
//            }];
//
//        }
//    } else {
//
//        if (self.facebookIsSuccess) {
//
//            [self.backgroundImageView removeFromSuperview];
//            [self.logoImageView removeFromSuperview];
//            [self.fbOpenAdView removeFromSuperview];
//
//            [kOVWindow addSubview:self.backgroundImageView];
//            [self.backgroundImageView makeConstraints:^(MASConstraintMaker *make) {
//                make.left.right.bottom.equalTo(0);
//            }];
//
//            [self.backgroundImageView addSubview:self.logoImageView];
//            [self.logoImageView makeConstraints:^(MASConstraintMaker *make) {
//                make.center.equalTo(0);
//            }];
//
//            [kOVWindow addSubview:self.fbOpenAdView];
//            [self.fbOpenAdView makeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(IPHONE_TOPSENSOR_HEIGHT);
//                make.left.right.equalTo(0);
//                make.bottom.equalTo(self.backgroundImageView.mas_top);
//            }];
//
//            [self.fbOpenAdView showNativeAd];
//
//        }
//    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self umStatisticsBeginLogPage];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self umStatisticsEndLogPage];
}

- (void)umStatisticsBeginLogPage {
    [OVUMClick umBeginLogPageView:NSStringFromClass([self class])];
}

- (void)umStatisticsEndLogPage {
    [OVUMClick umEndLogPageView:NSStringFromClass([self class])];
}

- (Class)rt_navigationBarClass {
    return [NavigationBar class];
}

- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action{
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navi_top_back"]
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:target
                                                                      action:action];
    backButtonItem.tintColor = [UIColor yellowColor];
    return backButtonItem;
}


- (void)showAutoDismissTextAlert:(NSString *)alert{
    // 先隐藏之前的
    [self.hud hideAnimated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = alert;
    [hud hideAnimated:YES afterDelay:2.f];
}

- (void)showWaitingHUD{
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)hideWaitingHUD{
    [self.hud hideAnimated:YES];
}

- (void) showWaitingHUDWithPartView:(UIView *)tempView {
    self.hud = [MBProgressHUD showHUDAddedTo:tempView animated:YES];
}

- (void)closeCurrentPage {
    if (self.pageCloseBlock) {
        self.pageCloseBlock();
    }
}

//- (UIImageView *)backgroundImageView {
//    if (_backgroundImageView == nil) {
//        _backgroundImageView = [[UIImageView alloc] init];
//        _backgroundImageView.image = [UIImage imageNamed:@"openAd_background"];
//        _backgroundImageView.backgroundColor = [UIColor whiteColor];
//    }
//    return _backgroundImageView;
//}
//
//- (UIImageView *)logoImageView {
//    if (_logoImageView == nil) {
//        _logoImageView = [[UIImageView alloc] init];
//        _logoImageView.image = [UIImage imageNamed:@"openAd_logo"];
//    }
//    return _logoImageView;
//}


@end
