//
//  Line.h
//  CaplessCoderPaint
//
//  Created by crossmo/yangcun on 14/10/29.
//  Copyright (c) 2014年 yangcun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Line : NSObject

@property (nonatomic) CGPoint begin;
@property (nonatomic) CGPoint end;
@property (nonatomic, retain) UIColor *color;

@end
