//
//  main.m
//  RandomPossessions
//
//  Created by Erin Parker on 4/6/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        BNRItem *backpack = [[BNRItem alloc] init];
        [backpack setItemName:@"Backpack"];
 
        
        BNRItem *calculator = [[BNRItem alloc] init];
        [calculator setItemName:@"Calculator"];
 
        
        [backpack setContainedItem:calculator];
        
        backpack = nil;
        
        NSLog(@"Container: %@", [calculator container]);
        
        calculator = nil;
        
    }
    return 0;
}

