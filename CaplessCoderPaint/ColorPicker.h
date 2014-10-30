//
//  ColorPicker.h
//  CaplessCoderPaint
//
//  Created by crossmo/yangcun on 14/10/29.
//  Copyright (c) 2014年 yangcun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ColorPickerDelegate <NSObject>
@optional
- (void)aColorPickerIsSelected:(UIColor *)color;
@end

@interface ColorPicker : UIView

@property (nonatomic,retain) id <ColorPickerDelegate> delegate;

@end
