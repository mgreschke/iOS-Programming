//
//  BNRExecutor.m
//  Blocky
//
//  Created by Erin Parker on 8/28/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "BNRExecutor.h"

@implementation BNRExecutor
@synthesize block;

- (int)computeWithValue:(int)value1 andValue:(int)value2
{
    // If a block variable is executed but doesn't point at a block return 0
    if (!block)
        return 0;
    
    // Return value of block with value 1 and value 2
    return block(value1, value2);
}

- (void)dealloc
{
    NSLog(@"Executor is being destroyed.");
}
@end
