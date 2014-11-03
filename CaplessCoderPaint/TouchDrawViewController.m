//
//  TouchDrawViewController.m
//  CaplessCoderPaint
//
//  Created by crossmo/yangcun on 14/10/29.
//  Copyright (c) 2014年 yangcun. All rights reserved.
//

#import "TouchDrawViewController.h"
#import "TouchDrawView.h"

@interface TouchDrawViewController ()

@end

@implementation TouchDrawViewController
@synthesize selector1;
@synthesize selector2;
@synthesize selector3;
@synthesize selector4;
@synthesize selector5;
@synthesize selector6;
@synthesize selector7;
@synthesize selector8;
@synthesize selector9;
@synthesize drewArea;
@synthesize selector0;


- (id)init
{
    self = [super initWithNibName:@"TouchDrawViewController"
                           bundle:nil];
    isSelectedColor = NO;
    isCleared = NO;

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [selector1 setDelegate:self];
    [selector2 setDelegate:self];
    [selector3 setDelegate:self];
    [selector4 setDelegate:self];
    [selector5 setDelegate:self];
    [selector6 setDelegate:self];
    [selector7 setDelegate:self];
    [selector8 setDelegate:self];
    [selector9 setDelegate:self];
    [selector0 setDelegate:self];
    
    NSLog(@"Loaded the view for HypnosisViewController");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)aColorPickerIsSelected:(UIColor *)color
{
    [drewArea setDrawColor:color];
    
    selector1.layer.borderWidth = 0.0f;
    selector2.layer.borderWidth = 0.0f;
    selector3.layer.borderWidth = 0.0f;
    selector4.layer.borderWidth = 0.0f;
    selector5.layer.borderWidth = 0.0f;
    selector6.layer.borderWidth = 0.0f;
    selector7.layer.borderWidth = 0.0f;
    selector8.layer.borderWidth = 0.0f;
    selector9.layer.borderWidth = 0.0f;
    selector0.layer.borderWidth = 0.0f;
}

- (IBAction)undo:(id)sender
{
    [drewArea undo];
}

- (IBAction)redo:(id)sender {
    [drewArea redo];
}

@end
