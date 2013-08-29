//
//  TouchViewController.m
//  TouchTracker
//
//  Created by Erin Parker on 8/27/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "TouchViewController.h"
#import "TouchDrawView.h"

@implementation TouchViewController

- (void)loadView
{
    [self setView:[[TouchDrawView alloc] initWithFrame:CGRectZero]];
}
@end
