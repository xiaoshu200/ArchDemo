//
//  DeviceAdapt.h
//  ArchDemo
//
//  Created by 方永清 on 16/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  屏幕宽度(e.g. 320)
 */
#define kScreenWith ([[UIScreen mainScreen] bounds].size.width > 735 ? kIPhone6PlusWidth : [[UIScreen mainScreen] bounds].size.width)
/**
 *  屏幕高度(e.g. 480)
 */
#define kScreenHeight ([[UIScreen mainScreen] bounds].size.height < 480 ? kIPhone6PlusHeight : [[UIScreen mainScreen] bounds].size.height)
#define kIPhone6PlusHeight      736.0
#define kIPhone6PlusWidth       414.0
#define kIPhone6Height          667.0
#define kIPhone6Width           375.0
#define kIPhone5Or5sHeight      568.0
#define kIPhone5Or5sWidth       320.0
#define kIPhone4Or4sHeight      480.0
#define kIPhone4Or4sWidth       320.0
#define kIPhoneStatusBarHeight  20.0

//定义屏幕适配大小的宏方便使用
#define autoScaleW(width) [DeviceAdapt autoScaleW:width]
#define autoScaleH(height) [DeviceAdapt autoScaleH:height]


@interface DeviceAdapt : NSObject

//当前屏幕与设计尺寸(iPhone6)宽度比例
+ (CGFloat)autoScaleW:(CGFloat)width;

//当前屏幕与设计尺寸(iPhone6)高度比例
+ (CGFloat)autoScaleH:(CGFloat)height;

@end
