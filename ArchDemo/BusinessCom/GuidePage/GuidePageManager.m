//
//  GuidePageManager.m
//  ArchDemo
//
//  Created by elegance on 17/3/6.
//  Copyright © 2017年 com.pingan. All rights reserved.
//

#import "GuidePageManager.h"
#import "GuidePageViewController.h"
#import "AppDelegate.h"
#import "TabbarManager.h"

#define k_FIRST_LAUNCH @"guidePagefirstLaunch"

@implementation GuidePageManager

#pragma mark - public

//第一次启动加载引导页，非第一次启动加载TabBar
+(void)createGuidePage{
    BOOL isFirstLaunch = [GuidePageManager isFirstLaunch];
    if (isFirstLaunch) {
        GuidePageViewController *guideVc = [[GuidePageViewController alloc] init];
        [AppDelegate sharedInstance].window.rootViewController = guideVc;
    }else{
        [TabbarManager createTabbar];
    }
}

#pragma mark - private

/*
 *  应用是否为第一次启动
 *  @return YES:第一次启动   NO：不是第一次启动
 */
+(BOOL)isFirstLaunch{
    BOOL preValue = [[NSUserDefaults standardUserDefaults] boolForKey:k_FIRST_LAUNCH];
    if (!preValue) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:k_FIRST_LAUNCH];
    }
    return !preValue;
}
@end
