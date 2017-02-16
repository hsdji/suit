//
//  CoreTextData.m
//  suit
//
//  Created by ekhome on 17/2/16.
//  Copyright © 2017年 xiaofei. All rights reserved.
//

#import "CoreTextData.h"

@implementation CoreTextData
-(void)setCtFrame:(CTFrameRef)ctFrame
{
    if (_ctFrame != ctFrame)
    {
        if (_ctFrame != nil)
        {
            CFRelease(_ctFrame);
        }
        CFRetain(_ctFrame);
        _ctFrame = ctFrame;
    }
}

-(void)dealloc
{
    if (_ctFrame != nil)
    {
        CFRelease(_ctFrame);
        _ctFrame = nil;
    }
}
@end
