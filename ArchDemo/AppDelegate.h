//
//  AppDelegate.h
//  ArchDemo
//
//  Created by 方永清 on 07/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 *  获取当前对象实例
 *
 *  @return 返回 AppDelegate对象
 */
+ (AppDelegate *)sharedInstance;

@end

