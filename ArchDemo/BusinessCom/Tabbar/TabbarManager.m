//
//  TabbarManager.m
//  ArchDemo
//
//  Created by 方永清 on 03/03/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import "TabbarManager.h"

#import "LCTabBarController.h"
#import "HomeVC.h"
#import "DiscoverVC.h"
#import "ProfileVC.h"
#import "AppDelegate.h"

@implementation TabbarManager

//创建tabbar
+ (void)createTabbar
{
    HomeVC *homeVC = [[HomeVC alloc] init];
    //homeVC.tabBarItem.badgeValue = @"23";
    homeVC.title = @"主页";
    homeVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
    homeVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_home_selected"];
    
    DiscoverVC *discoverVC = [[DiscoverVC alloc] init];
    discoverVC.title = @"发现";
    discoverVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
    discoverVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_discover_selected"];
    
    ProfileVC *profileVC = [[ProfileVC alloc] init];
    profileVC.title = @"我的";
    profileVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
    profileVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_profile_selected"];
    
    UINavigationController *navHomeVC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    UINavigationController *navDiscoverVC = [[UINavigationController alloc] initWithRootViewController:discoverVC];
    UINavigationController *navProfileVC = [[UINavigationController alloc] initWithRootViewController:profileVC];
    
    LCTabBarController *tabBarC = [[LCTabBarController alloc] init];
    //    tabBarC.itemTitleFont          = [UIFont boldSystemFontOfSize:11.0f];
    //    tabBarC.itemTitleColor         = [UIColor greenColor];
    //    tabBarC.selectedItemTitleColor = [UIColor redColor];
    //    tabBarC.itemImageRatio         = 0.5f;
    //    tabBarC.badgeTitleFont         = [UIFont boldSystemFontOfSize:12.0f];
    
    tabBarC.viewControllers = @[navHomeVC, navDiscoverVC, navProfileVC];
    
    [AppDelegate sharedInstance].window.rootViewController = tabBarC;
}


@end
