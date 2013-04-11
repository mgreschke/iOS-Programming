//
//  HypnosisView.m
//  Hypnosister Silver
//
//  Created by Erin Parker on 4/10/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import "HypnosisView.h"
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
    
    // Find center of bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // The radius of the circle should be nearly as big as the view
    float maxRadius = hypot(bounds.size.height, bounds.size.width) / 2.0;
    
    // Thickness of line
    CGContextSetLineWidth(ctx, 10);
    
    // Draw concentric circles from the outside in
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
     
        CGFloat r = (float)rand() / RAND_MAX;
        CGFloat g = (float)rand() / RAND_MAX;
        CGFloat b = (float)rand() / RAND_MAX;
        
        UIColor *randColor = [[UIColor alloc] initWithRed:r green:g blue:b alpha:1.0];

        [randColor setStroke];
        
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(ctx);

    }

    // Drawing the Axes
    CGContextSaveGState(ctx);
    
    // Set Crosshair to Green Color
    CGContextSetRGBStrokeColor(ctx, 0, 1.0, 0, 1.0);
    
    // Draw Bottom Line
    CGContextMoveToPoint(ctx, center.x, center.y);
    CGContextAddLineToPoint(ctx, center.x, bounds.size.height);
    
    // Draw Left Line
    CGContextMoveToPoint(ctx, center.x, center.y);
    CGContextAddLineToPoint(ctx, -bounds.size.width, center.y);
    
    // Draw Top Line
    CGContextMoveToPoint(ctx, center.x, center.y);
    CGContextAddLineToPoint(ctx, center.x, -bounds.size.height);
    
    // Draw Bottom Line
    CGContextMoveToPoint(ctx, center.x, center.y);
    CGContextAddLineToPoint(ctx, bounds.size.width, center.y);
    
    // Draw Text
    CGContextStrokePath(ctx);
    CGContextBeginPath(ctx);
    
    NSString *text = @"You are getting sleepy.";
    
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    
    textRect.size = [text sizeWithFont:font];
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    [[UIColor blackColor] setFill];
    
    // Shadow will be 4 points right and 3 points down from text
    CGSize offset = CGSizeMake(4,3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    
    // All subsequent drawings will be shadowed
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    
    [text drawInRect:textRect withFont:font];
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
