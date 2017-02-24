//
//  AppDelegate.m
//  ArchDemo
//
//  Created by 方永清 on 07/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import "AppDelegate.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import "QryViewController.h"
#import "GuidePageViewController.h"
#import "YTKNetworkConfig.h"
#import "LifeViewController.h"
#import "MineViewController.h"
#import "MainViewController.h"
#import "NewsViewController.h"
#import "FinanceViewController.h"
#import "YMTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
    
    //引导页处理
    BOOL isShowIntrodctryPage = NO;
    if (isShowIntrodctryPage) {
        GuidePageViewController *introductVc = [[GuidePageViewController alloc] init];
        self.window.rootViewController = introductVc;
    }else{
        [self createTabBarPage];
    }
    [self.window makeKeyAndVisible];

    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.debugLogEnabled = YES;
    
    return YES;
}

//初始化分栏控制器页面
-(void)createTabBarPage{
    YMTabBarController *tabBar = [[YMTabBarController alloc] init];
    self.window.rootViewController = tabBar;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
