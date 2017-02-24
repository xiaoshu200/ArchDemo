//
//  UIColor+YM.m
//  ArchDemo
//
//  Created by elegance on 17/2/24.
//  Copyright © 2017年 com.pingan. All rights reserved.
//

#import "UIColor+YM.h"

@implementation UIColor (YM)
//默认alpha值为1
+ (UIColor *)ym_colorWithHexString:(NSString *)color
{
    return [self ym_colorWithHexString:color alpha:1.0f];
}

+ (UIColor *)ym_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]||[cString hasPrefix:@"0x"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    
    if (cString.length == 3 || cString.length == 4)
    {
        unichar chars[8];
        for (NSInteger i = 0; i < cString.length; i++) {
            unichar c = [cString characterAtIndex:i];
            chars[2 * i] = c;
            chars[2 * i + 1] = c;
        }
        cString = [NSString stringWithCharacters:chars length:cString.length * 2];
    }
    
    if ([cString length] == 8)
    {
        NSString *aString = [cString substringToIndex:2];
        unsigned int a;
        [[NSScanner scannerWithString:aString] scanHexInt:&a];
        cString = [cString substringFromIndex:2];
        alpha = a / 255.f;
    }
    
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

@end
