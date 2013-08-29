//
//  HeavyViewController.m
//  HeavyRotation
//
//  Created by Erin Parker on 4/14/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import "HeavyViewController.h"

@implementation HeavyViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)x
{
    // Return YES if incoming orientation is Portrait or Landscape
    // otherwise, return NO
    
    return (x == UIInterfaceOrientationPortrait)
    || UIInterfaceOrientationIsLandscape(x);
}
@end
