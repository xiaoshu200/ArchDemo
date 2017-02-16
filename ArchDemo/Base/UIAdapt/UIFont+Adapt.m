//
//  UIFont+Adapt.m
//  ArchDemo
//
//  Created by 方永清 on 16/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import "UIFont+Adapt.h"
#import "FontTool.h"

@implementation UIFont (ScaleFontCategory)

- (UIFont *)scalefontWithSize:(CGFloat)fontSize
{
    return [self fontWithSize:[FontTool getScaleFontWithOriginFontSize:fontSize]];
}

+ (UIFont *)scaleSystemFontOfSize:(CGFloat)fontSize
{
    return [self systemFontOfSize:[FontTool getScaleFontWithOriginFontSize:fontSize]];
}

+ (UIFont *)scaleBoldSystemFontOfSize:(CGFloat)fontSize
{
    return [self boldSystemFontOfSize:[FontTool getScaleFontWithOriginFontSize:fontSize]];
}

+ (UIFont *)scaleItalicSystemFontOfSize:(CGFloat)fontSize
{
    return [self italicSystemFontOfSize:[FontTool getScaleFontWithOriginFontSize:fontSize]];
}

+ (UIFont *)scaleChineseItalicSystemFontOfSize:(CGFloat)fontSize
{
    //  设置反射。倾斜15度。
    CGAffineTransform matrix = CGAffineTransformMake(1, 0, tanf(15 * (CGFloat)M_PI / 180), 1, 0, 0);
    //  取得系统字符并设置反射
    UIFontDescriptor *desc = [ UIFontDescriptor fontDescriptorWithName:[self scaleSystemFontOfSize:fontSize].fontName matrix:matrix];
    
    return [UIFont fontWithDescriptor:desc size:[FontTool getScaleFontWithOriginFontSize:fontSize]];
}

+ (UIFont *)scaleFontWithName:(NSString *)fontName size:(CGFloat)fontSize
{
    return [self fontWithName:fontName size:[FontTool getScaleFontWithOriginFontSize:fontSize]];
}

@end

