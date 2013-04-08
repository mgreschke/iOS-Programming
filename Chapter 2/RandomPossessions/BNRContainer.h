//
//  BNRContainer.h
//  RandomPossessions
//
//  Created by Erin Parker on 4/7/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
    NSString *containerName;
    int containerValueInDollars;
    NSMutableArray *subItems;
}

- (id)initWithContainerName: (NSString *)name
    containerValueInDollars: (int)value
                   subItems: (NSMutableArray *)items;

- (void)addItem:(BNRItem *)newItem;

- (void)setContainerName: (NSString *)str;
- (NSString *)containerName;

- (void)setContainerValueInDollars: (int)i;
- (int)containerValueInDollars;

- (void)subItems: (NSMutableArray *)items;
- (NSArray *)subItems;

@end
