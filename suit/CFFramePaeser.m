//
//  CFFramePaeser.m
//  suit
//
//  Created by ekhome on 17/2/16.
//  Copyright © 2017年 xiaofei. All rights reserved.
//

#import "CFFramePaeser.h"

@implementation CFFramePaeser
+(NSDictionary *)attributesWithConfig:(CFFrameParserConfig *)config{
    CGFloat flontSize = config.fontSize;
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"ArialMT", flontSize, NULL);
    CGFloat lineSpacing = config.lineSpace;
    const CFIndex kNumberofSettings = 3;
    CTParagraphStyleSetting theSettings[kNumberofSettings] = {
        {kCTParagraphStyleSpecifierLineSpacingAdjustment,sizeof(CGFloat),&lineSpacing},
        {kCTParagraphStyleSpecifierMaximumLineSpacing,sizeof(CGFloat),&lineSpacing},
        {kCTParagraphStyleSpecifierMinimumLineSpacing,sizeof(CGFloat),&lineSpacing},
        
    };
    CTParagraphStyleRef theparagraphgRef = CTParagraphStyleCreate(theSettings, kNumberofSettings);
    
    UIColor *textColor = config.textColor;
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[(id)kCTForegroundColorAttributeName] = (id)textColor.CGColor;
    dic[(id)kCTFontAttributeName] = (__bridge id)fontRef;
    dic[(id)kCTGlyphInfoAttributeName] = (__bridge id)theparagraphgRef;
    CFRelease(theparagraphgRef);
    CFRelease(fontRef);
    return dic;
}

+(CoreTextData *)parserContent:(NSString *)content config:(CFFrameParserConfig *)config
{
    NSDictionary *attributes = [self attributesWithConfig:config];
    NSAttributedString *contentString = [[NSAttributedString alloc]initWithString:content attributes:attributes];
//    创建CTFramesetterRef实例
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)contentString);
//    获得要绘制的区域的高度
    CGSize restrictSize = CGSizeMake(config.width, [UIApplication sharedApplication].keyWindow.frame.size.height);
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), nil, restrictSize, nil);
    CGFloat textHeight = coreTextSize.height;
//    生成CTFrameRef实例
    CTFrameRef frame = [self createFrameWithFramesetter:framesetter config:config height:textHeight];
//    将生成的好的额CTFrameRef实例和计算好的绘制高度保存道CoreTextData实例中，最后返回CoreTextData实例
    CoreTextData *data = [[CoreTextData alloc]init];
    data.ctFrame = frame;
    data.height = textHeight;
    CFRelease(frame);
    CFRelease(framesetter);
    return data;
}


+(CTFrameRef)createFrameWithFramesetter:(CTFramesetterRef)framesetter config:(CFFrameParserConfig *)config height:(CGFloat)height{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, config.width, height));
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFRelease(path);
    return frame;
    
}
@end
