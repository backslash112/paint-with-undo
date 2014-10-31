//
//  Common.h
//  CaplessCoderPaint
//
//  Created by crossmo/yangcun on 14/10/31.
//  Copyright (c) 2014年 yangcun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject

+ (BOOL)color:(UIColor *)color1
isEqualToColor:(UIColor *)color2
withTolerance:(CGFloat)tolerance;

@end
