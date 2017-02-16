//
//  DeviceUtil.h
//  ArchDemo
//
//  Created by 方永清 on 16/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DeviceUtil : NSObject

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

// 获取UUID
+ (NSString *)getUDID;

@end
