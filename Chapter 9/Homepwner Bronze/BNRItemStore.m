//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Erin Parker on 4/15/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemStore

+ (BNRItemStore *)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    if (!sharedStore)
        sharedStore = [[super allocWithZone:nil] init];
    
    return sharedStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

- (id)init
{
    self = [super init];
    if (self) {
        allItems = [[NSMutableArray alloc] init];
        cheapItems = [[NSMutableArray alloc] init];
        expensiveItems = [[NSMutableArray alloc] init];
    }

    return self;
}

- (NSArray *)allItems
{
    return allItems;
}

- (NSArray *)cheapItems
{
    return cheapItems;
}

- (NSArray *)expensiveItems
{
    return expensiveItems;
}

- (BNRItem *)createItem
{
    BNRItem *p = [BNRItem randomItem];
    
    [allItems addObject:p];

    if ([p valueInDollars] < 50) {
        [cheapItems addObject:p];
        NSLog(@"Cheap Items Array: %@", cheapItems);
    } else {
        [expensiveItems addObject:p];
        NSLog(@"%@", expensiveItems);
    }

    return p;
}

@end
