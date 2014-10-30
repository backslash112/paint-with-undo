//
//  TouchDrawViewController.h
//  CaplessCoderPaint
//
//  Created by crossmo/yangcun on 14/10/29.
//  Copyright (c) 2014年 yangcun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorPicker.h"
#import "TouchDrawView.h"

@interface TouchDrawViewController : UIViewController <ColorPickerDelegate>
{
    BOOL isCleared;
    BOOL isSelectedColor;
}

@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector1;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector2;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector3;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector4;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector5;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector6;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector7;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector8;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector9;
@property (retain, nonatomic) IBOutlet TouchDrawView *drewArea;

- (IBAction)undo:(id)sender;

@end
