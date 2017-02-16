//
//  FontTool.m
//  ArchDemo
//
//  Created by 方永清 on 16/02/2017.
//  Copyright © 2017 com.pingan. All rights reserved.
//

#import "FontTool.h"
#import "DeviceHelper.h"

/*
 英文字体的1磅，相当于1/72 英寸，约等于1/2.8mm。
 12PT的字打印出来约为4.2mm。网页中12px的字才相当于12像素。
 虽然 四号=(14/72)*96=18.6px 更接近 19px，但是因为 18px 是点阵，所以系统还是优先显示点阵字号的。
 换句话说：四号=18px
 中文字号VS英文字号(磅)VS像素值的对应关系：
 八号＝5磅(5pt) ==(5/72)*96=6.67 =6px
 七号＝5.5磅 ==(5.5/72)*96=7.3 =7px
 小六＝6.5磅 ==(6.5/72)*96=8.67 =8px
 六号＝7.5磅 ==(7.5/72)*96=10px
 小五＝9磅 ==(9/72)*96=12px
 五号＝10.5磅 ==(10.5/72)*96=14px
 小四＝12磅 ==(12/72)*96=16px
 四号＝14磅 ==(14/72)*96=18.67 =18px
 小三＝15磅 ==(15/72)*96=20px
 三号＝16磅 ==(16/72)*96=21.3 =21px
 小二＝18磅 ==(18/72)*96=24px
 二号＝22磅 ==(22/72)*96=29.3 =29px
 小一＝24磅 ==(24/72)*96=32px
 一号＝26磅 ==(26/72)*96=34.67 =34px
 小初＝36磅 ==(36/72)*96=48px
 初号＝42磅 ==(42/72)*96=56px
 */

/*
 ios常用字号规范(72像素/英寸下的字号大小规律):
 导航栏：34~42px；现在标题越来越小，一般34或36比较合适
 标签栏文字：20~24px。ios自带应用都是20px。标签栏最(图标+文字)形式的话不要大于22比较合适
 正文：28~36px，基本上新闻类基本都在用36，比如网易新闻正文部分。
 ios人机界面指南上的具体要求：
 作为对照，正文样式在大号字体上使用34px字体大小，最小也不应小于22px.
 通常来说，每一档文字大小设置的字体大小和行间距的差异是2px。一般为了区别开标题和正文字体大小差异要至少为4px.
 标题和正文样式使用一样的字体大小。为了将其和正文样式区分，标题样式使用中等效果。
 参考地址：http://www.jianshu.com/p/45d48c164b0e
 */

@implementation FontTool

+ (CGFloat)getScaleFontWithOriginFontSize:(CGFloat)originFont
{
    if (originFont == 0) {
        return 17.0;
    }
    NSInteger device = [DeviceHelper currentResolution];
    NSString *str = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"FontSizeScale.plist"];
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:str];
    for (NSDictionary *itemDic in plistArray) {
        if ([itemDic[@"UIDeviceResolution"] integerValue] == device) {
            originFont *= [itemDic[@"FontScale"] floatValue];
            break;
        }
    }
    return originFont;
}

/** return a font as close to a pixel size as possible
 example:
 UIFont *font = [Utils fontWithName:@"HelveticaNeue-Medium" sizeInPixels:33];
 @param fontName name of font same as UIFont fontWithName
 @param pixels size in pixels for font
 */
+(UIFont *) fontWithName:(NSString *) fontName sizeInPixels:(CGFloat) pixels {
    static NSMutableDictionary *fontDict; // to hold the font dictionary
    if ( fontName == nil ) {
        // we default to @"HelveticaNeue-Medium" for our default font
        fontName = @"HelveticaNeue-Medium";
    }
    if ( fontDict == nil ) {
        fontDict = [ @{} mutableCopy ];
    }
    // create a key string to see if font has already been created
    //
    NSString *strFontHash = [NSString stringWithFormat:@"%@-%f", fontName , pixels];
    UIFont *fnt = fontDict[strFontHash];
    if ( fnt != nil ) {
        return fnt; // we have already created this font
    }
    // lets play around and create a font that falls near the point size needed
    CGFloat pointStart = pixels/4;
    CGFloat lastHeight = -1;
    UIFont * lastFont = [UIFont fontWithName:fontName size:.5];\
    
    NSMutableDictionary * dictAttrs = [ @{ } mutableCopy ];
    NSString *fontCompareString = @"Mgj^";
    for ( CGFloat pnt = pointStart ; pnt < 1000 ; pnt += .5 ) {
        UIFont *font = [UIFont fontWithName:fontName size:pnt];
        if ( font == nil ) {
            NSLog(@"Unable to create font %@" , fontName );
            NSAssert(font == nil, @"font name not found in fontWithName:sizeInPixels" ); // correct the font being past in
        }
        dictAttrs[NSFontAttributeName] = font;
        CGSize cs = [fontCompareString sizeWithAttributes:dictAttrs];
        CGFloat fheight =  cs.height;
        if ( fheight == pixels  ) {
            // that will be rare but we found it
            fontDict[strFontHash] = font;
            return font;
        }
        if ( fheight > pixels ) {
            if ( lastFont == nil ) {
                fontDict[strFontHash] = font;
                return font;
            }
            // check which one is closer last height or this one
            // and return the user
            CGFloat fc1 = fabs( fheight - pixels );
            CGFloat fc2 = fabs( lastHeight  - pixels );
            // return the smallest differential
            if ( fc1 < fc2 ) {
                fontDict[strFontHash] = font;
                return font;
            } else {
                fontDict[strFontHash] = lastFont;
                return lastFont;
            }
        }
        lastFont = font;
        lastHeight = fheight;
    }
    NSAssert( false, @"Hopefully should never get here");
    return nil;
}

@end
