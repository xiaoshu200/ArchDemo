//
//  DeviceAdapt.m
//  ArchDemo
//
//  Created by 方永清 on 16/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import "DeviceAdapt.h"


@implementation DeviceAdapt

#pragma mark - ScaleSize

//当前屏幕与设计尺寸(iPhone6)宽度比例
+ (CGFloat)autoScaleW:(CGFloat)width {
    CGFloat autoSizeScaleW = 1;
    if (kScreenHeight == 480) {
        //4s
        autoSizeScaleW = kScreenWith / 375;
    }else if(kScreenHeight == 568) {
        //5
        autoSizeScaleW = kScreenWith / 375;
    }else if(kScreenHeight == 667){
        //6
        autoSizeScaleW = kScreenWith / 375;
    }else if(kScreenHeight == 736){
        //6p
        autoSizeScaleW = kScreenWith / 375;
    }else{
        autoSizeScaleW = 1;
    }
    
    return width * autoSizeScaleW;
}

//当前屏幕与设计尺寸(iPhone6)高度比例
+ (CGFloat)autoScaleH:(CGFloat)height {
    CGFloat autoSizeScaleH = 1;
    if (kScreenHeight == 480) {
        //4s
        autoSizeScaleH = kScreenHeight / 667;
    }else if(kScreenHeight == 568) {
        //5
        autoSizeScaleH = kScreenHeight / 667;
    }else if(kScreenHeight == 667){
        //6
        autoSizeScaleH = kScreenHeight / 667;
    }else if(kScreenHeight == 736){
        //6p
        autoSizeScaleH = kScreenHeight / 667;
    }else{
        autoSizeScaleH = 1;
    }
    
    return height * autoSizeScaleH;
}

@end
