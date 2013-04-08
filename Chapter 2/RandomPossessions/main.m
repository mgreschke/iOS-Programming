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

        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 3; i++) {
            BNRItem *p = [BNRItem randomItem];
            [items addObject:p];
        }
        
        BNRItem *dog = [[BNRItem alloc] initWithItemName:@"Dog" valueInDollars:10 serialNumber:@"EREWR"];
        
        BNRItem *cat = [[BNRItem alloc] initWithItemName:@"Cat" valueInDollars:10 serialNumber:@"WERE"];
        
        BNRContainer *c = [[BNRContainer alloc] initWithContainerName:@"Animal Container" containerValueInDollars:0 subItems:nil];
        
        BNRContainer *d = [[BNRContainer alloc] initWithContainerName:@"Insect Container" containerValueInDollars:0 subItems:nil];
        
        [c addItem:dog];
        [c addItem:cat];
        [c addItem:d];

        NSLog(@"%@", c);
        
        NSLog(@"My name is: %@", [c containerName]);
        NSLog(@"I am worth: $%d", [c containerValueInDollars]);
        NSLog(@"My items include: %@", [c subItems]);
    
        items = nil;
        
    }
    return 0;
}

