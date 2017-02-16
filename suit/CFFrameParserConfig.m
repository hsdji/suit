//
//  CFFrameParserConfig.m
//  suit
//
//  Created by ekhome on 17/2/16.
//  Copyright © 2017年 xiaofei. All rights reserved.
//

#import "CFFrameParserConfig.h"

@implementation CFFrameParserConfig
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _width = 200.f;
        _fontSize = 16.0f;
        _lineSpace = 8.0f;
        _textColor = [UIColor colorWithRed:108/255.0 green:108/255.0 blue:108/255.0 alpha:1.0];
    }
    return self;
}
@end
