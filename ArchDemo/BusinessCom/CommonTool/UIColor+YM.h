//
//  UIColor+YM.h
//  ArchDemo
//
//  Created by elegance on 17/2/24.
//  Copyright © 2017年 com.pingan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YM)
//十六机制颜色转换为UIColor eg:把@"#a98142"转换为UIColor
+ (UIColor *)ym_colorWithHexString:(NSString *)color;
+ (UIColor *)ym_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end
