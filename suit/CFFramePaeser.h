//
//  CFFramePaeser.h
//  suit
//
//  Created by ekhome on 17/2/16.
//  Copyright © 2017年 xiaofei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreTextData.h"
#import "CFFrameParserConfig.h"
@interface CFFramePaeser : NSObject
+ (CoreTextData *)parserContent:(NSString *)content config:(CFFrameParserConfig *)config;
@end
