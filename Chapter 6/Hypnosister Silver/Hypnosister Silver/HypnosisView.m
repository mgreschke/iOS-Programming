//
//  HypnosisView.m
//  Hypnosister Silver
//
//  Created by Erin Parker on 4/10/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import "HypnosisView.h"
#import "HypnosisViewController.h"
#define kGutter 10 

@implementation HypnosisView

@synthesize circleColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}


- (void)drawRect:(CGRect)dirtyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    CGRect bounds = [self bounds];
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.height, bounds.size.width) / 2.0;
    
    CGContextSetLineWidth(ctx, 10);
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
    CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
    CGContextStrokePath(ctx);

    }
    
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)setCircleColor:(UIColor *)clr
{
    circleColor = clr;
    [self setNeedsDisplay];
}


- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"Device started shaking!");
        [self setCircleColor:[UIColor redColor]];
    }
    
}

@end
