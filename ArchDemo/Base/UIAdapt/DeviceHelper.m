//
//  DeviceHelper.m
//  DeviceInfo
//
//  Created by Lee on 16/1/25.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "DeviceHelper.h"
#import <sys/types.h>
#import <sys/sysctl.h>
#import <mach/mach.h>
#include <sys/mount.h>


@implementation DeviceHelper

+(UIDeviceResolution)currentResolution
{    
    CGSize result = [[UIScreen mainScreen] bounds].size;
    result = CGSizeMake(result.width * [UIScreen mainScreen].scale, result.height * [UIScreen mainScreen].scale);
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (result.width == 640.0f) {
            return (result.height == 960 ? UIDevice_iPhoneHiRes : UIDevice_iPhone5);
        }else{
            return (result.width == 750 ? UIDevice_iPhone6 : UIDevice_iPhone6pluse );
        }
    }
    return 0;
}

///判断手机尺寸型号
- (NSString*)judePhone6PString{
    NSString *xinghao =nil;
    double height = [UIScreen mainScreen].bounds.size.height;
    if(height == 736) {
        xinghao = @"6p";
    }
    else if(height == 667){
        xinghao = @"6";
    }
    else if(height == 568){
        xinghao = @"5";
    }
    else if(height == 480){
        xinghao = @"4";
    }
    return xinghao;
}

/*判断型号模式
 [UIScreen mainScreen].currentMode.size
 */
- (void)judeingIphoneSize{
    CGSize currentSize = [UIScreen mainScreen].currentMode.size;
    CGSize size6PBig = CGSizeMake(1125, 2001);
    CGSize size6P = CGSizeMake(1242, 2208);
    CGSize size6Big = CGSizeMake(640, 1136);
    CGSize size6 = CGSizeMake(750, 1334);
    CGSize size5 = CGSizeMake(750, 1334);
    CGSize size4 = CGSizeMake(640, 960);
    BOOL is6PB = CGSizeEqualToSize(currentSize, size6PBig);
    BOOL is6P  = CGSizeEqualToSize(currentSize, size6P);
    BOOL is6B  = CGSizeEqualToSize(currentSize, size6Big);
    BOOL is6   = CGSizeEqualToSize(currentSize, size6);
    BOOL is5   = CGSizeEqualToSize(currentSize, size5);
    BOOL is4   = CGSizeEqualToSize(currentSize, size4);
    if(is6PB && [[self judePhone6PString] isEqualToString:@"6"]){
        NSLog(@"6p放大模式");
    }
    else if(is6P && [[self judePhone6PString] isEqualToString:@"6p"]){
        NSLog(@"6p标准模式");
    }
    else if(is6B && [[self judePhone6PString] isEqualToString:@"5"]){
        NSLog(@"6放大模式");
    }
    else if(is6 && [[self judePhone6PString] isEqualToString:@"6"]){
        NSLog(@"6标准模式");
    }
    else if(is5 && [[self judePhone6PString] isEqualToString:@"5"]){
        NSLog(@"5标准模式");
    }
    else if(is4 && [[self judePhone6PString]isEqualToString:@"4"]){
        NSLog(@"4标准模式");
    }
}


@end
