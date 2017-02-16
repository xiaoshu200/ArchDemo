//
//  DeviceHelper.h
//  DeviceInfo
//
//  Created by Lee on 16/1/25.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*    CGRect rect_screen = [[UIScreen mainScreen]bounds];
 CGSize size_screen = rect_screen.size;
 CGFloat scale_screen = [UIScreen mainScreen].scale;
 CGFloat width = size_screen.width*scale_screen;
 CGFloat height = size_screen.height*scale_screen;
 NSLog(@"width:%f",width);
 NSLog(@"height:%f",height);
 
 2015-03-04 15:35:06.340 reader[10697:179349] width:640.000000
 2015-03-04 15:35:06.341 reader[10697:179349] height:1136.000000
 
 上述情况在iphone6和iPhone6 Plus的缩放模式下，和iPhone5S获取到的分辨率是一样的。
 */
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//放大版的iphone6等于Iphone5的分辨率
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)) : NO)

#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

enum {
    // iPhone 4,4S 高清分辨率(640x960px)
    UIDevice_iPhoneHiRes            = 1,
    // iPhone 5 高清分辨率(640x1136px)
    UIDevice_iPhone5                = 2,
    // iPhone 6  高清分辨率(750x1134px)
    UIDevice_iPhone6                = 3,
    // iPhone 6+ 高清分辨率(1242x2208px)
    UIDevice_iPhone6pluse          = 4,
}; typedef NSUInteger UIDeviceResolution;

@interface DeviceHelper : NSObject

// 当前分辨率
+ (UIDeviceResolution) currentResolution;
// 当前设备分辨率
+ (NSString *)getCurrentDeviceModel;
// 获取设备信息
+ (void)getDeviceInfo;
// 获取设备电量电量
+(CGFloat)getBatteryQuantity;
// 设备总内存
+(NSString *)getTotalMemorySize;
// 设备可用内存
+(NSString *)getAvailableMemorySize;
// 磁盘总大小
+ (NSString *)getTotalDiskSize;

// 可用磁盘大小
+ (NSString *)getAvailableDiskSize;
//宿主APP版本号
+ (NSString *)getAppVersion;
// 获取UUID
+ (NSString *)getUDID;



@end
