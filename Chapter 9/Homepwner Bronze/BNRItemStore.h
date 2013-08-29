//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Erin Parker on 4/15/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRItem;

@interface BNRItemStore : NSObject
{
    NSMutableArray *allItems;
    NSMutableArray *cheapItems;
    NSMutableArray *expensiveItems;
}

+ (BNRItemStore *)sharedStore;

- (NSArray *)allItems;
- (NSArray *)cheapItems;
- (NSArray *)expensiveItems;
- (BNRItem *)createItem;

@end
