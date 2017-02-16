//
//  UIFont+Adapt.h
//  ArchDemo
//
//  Created by 方永清 on 16/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Adapt)

- (UIFont *)scalefontWithSize:(CGFloat)fontSize;
+ (UIFont *)scaleSystemFontOfSize:(CGFloat)fontSize;
+ (UIFont *)scaleBoldSystemFontOfSize:(CGFloat)fontSize;
+ (UIFont *)scaleItalicSystemFontOfSize:(CGFloat)fontSize;
/**
 *  支持中文斜体
 *
 *  @param fontSize 字体大小
 *
 *  @return UIFont
 */
+ (UIFont *)scaleChineseItalicSystemFontOfSize:(CGFloat)fontSize;

+ (UIFont *)scaleFontWithName:(NSString *)fontName size:(CGFloat)fontSize;

@end
