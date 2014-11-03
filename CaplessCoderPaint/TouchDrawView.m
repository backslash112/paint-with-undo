//
//  TouchDrawView.m
//  CaplessCoderPaint
//
//  Created by crossmo/yangcun on 14/10/29.
//  Copyright (c) 2014年 yangcun. All rights reserved.
//

#import "TouchDrawView.h"
#import "Common.h"

@implementation TouchDrawView
{
    BOOL _isEraser;
}
@synthesize currentLine;
@synthesize linesCompleted;
@synthesize drawColor;

- (id)initWithCoder:(NSCoder *)c
{
    self = [super initWithCoder:c];
    if (self) {
        linesCompleted = [[NSMutableArray alloc] init];
        [self setMultipleTouchEnabled:YES];
        
        drawColor = [UIColor blackColor];
        [self becomeFirstResponder];
    }
    return self;
}

//  It is a method of UIView called every time the screen needs a redisplay or refresh.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 5.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    for (Line *line in linesCompleted) {
        [[line color] set];
        CGContextMoveToPoint(context, [line begin].x, [line begin].y);
        CGContextAddLineToPoint(context, [line end].x, [line end].y);
        CGContextStrokePath(context);
    }
}

- (void)undo
{
    if ([self.undoManager canUndo]) {
        [self.undoManager undo];
    }
}

- (void)redo
{
    if ([self.undoManager canRedo]) {
        [self.undoManager redo];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.undoManager beginUndoGrouping];
    for (UITouch *t in touches) {
        // Create a line for the value
        CGPoint loc = [t locationInView:self];
        Line *newLine = [[Line alloc] init];
        [newLine setBegin:loc];
        [newLine setEnd:loc];
        [newLine setColor:drawColor];
        currentLine = newLine;
    }
}

- (void)addLine:(Line*)line
{
    [[self.undoManager prepareWithInvocationTarget:self] removeLine:line];
    [linesCompleted addObject:line];
    [self setNeedsDisplay];
}

- (void)removeLine:(Line*)line
{
    if ([linesCompleted containsObject:line]) {
        [[self.undoManager prepareWithInvocationTarget:self] addLine:line];
        [linesCompleted removeObject:line];
        [self setNeedsDisplay];
    }
}

- (void)removeLineByEndPoint:(CGPoint)point
{
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        Line *evaluatedLine = (Line*)evaluatedObject;
//        return (evaluatedLine.end.x == point.x && evaluatedLine.end.y == point.y) ||
//               (evaluatedLine.end.x == point.x - 1.0f && evaluatedLine.end.y == point.y - 1.0f) ||
//               (evaluatedLine.end.x == point.x + 1.0f && evaluatedLine.end.y == point.y + 1.0f);
        return (evaluatedLine.end.x <= point.x-1 || evaluatedLine.end.x > point.x+1) &&
               (evaluatedLine.end.y <= point.y-1 || evaluatedLine.end.y > point.y+1);
    }];
    NSArray *result = [linesCompleted filteredArrayUsingPredicate:predicate];
    if (result && result.count > 0) {
        [linesCompleted removeObject:result[0]];
    }
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!isCleared) {
        for (UITouch *t in touches) {
            [currentLine setColor:drawColor];
            CGPoint loc = [t locationInView:self];
            [currentLine setEnd:loc];
            
            if (currentLine) {
                if ([Common color:drawColor isEqualToColor:[UIColor clearColor] withTolerance:0.2]) {
                    // eraser
                    // [self removeLineByEndPoint:loc]; //this solution can not work.
                    _isEraser = YES;
                } else {
                    _isEraser = NO;
                    [self addLine:currentLine];
                }
            }
            Line *newLine = [[Line alloc] init];
            [newLine setBegin:loc];
            [newLine setEnd:loc];
            [newLine setColor:drawColor];
            currentLine = newLine;
        }
    }
}

- (void)endTouches:(NSSet *)touches
{
    if (!isCleared) {
        [self setNeedsDisplay];
    } else {
        isCleared = NO;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endTouches:touches];
    [self.undoManager endUndoGrouping];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endTouches:touches];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)didMoveToWindow
{
    [self becomeFirstResponder];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

@end
