//
//  Common.m
//  CaplessCoderPaint
//
//  Created by crossmo/yangcun on 14/10/31.
//  Copyright (c) 2014年 yangcun. All rights reserved.
//

#import "Common.h"

@implementation Common

+ (BOOL)color:(UIColor *)color1
isEqualToColor:(UIColor *)color2
withTolerance:(CGFloat)tolerance {
    
    CGFloat r1, g1, b1, a1, r2, g2, b2, a2;
    [color1 getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
    [color2 getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    return
    fabs(r1 - r2) <= tolerance &&
    fabs(g1 - g2) <= tolerance &&
    fabs(b1 - b2) <= tolerance &&
    fabs(a1 - a2) <= tolerance;
}


@end
