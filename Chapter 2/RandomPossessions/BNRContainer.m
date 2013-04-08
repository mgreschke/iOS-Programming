//
//  BNRContainer.m
//  RandomPossessions
//
//  Created by Erin Parker on 4/7/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

- (id)initWithContainerName: (NSString *)name
    containerValueInDollars: (int)value
                   subItems: (NSMutableArray *)items
{
    self = [super init];
    
    if (self) {
        [self setContainerName:name];
        [self setContainerValueInDollars:value];
        subItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addItem:(BNRItem *)newItem
{
    [subItems addObject:newItem];
    containerValueInDollars += [newItem valueInDollars];
}

- (void)setContainerName: (NSString *)str
{
    containerName = str;
}
- (NSString *)containerName
{
    return containerName;
}

- (void)setContainerValueInDollars: (int)i
{
    i = valueInDollars;
    containerValueInDollars = i;
}
- (int)containerValueInDollars
{
    return containerValueInDollars;
}

- (void)setSubItems: (NSMutableArray *)items
{
    subItems = items;
}
- (NSMutableArray *)subItems
{
    return subItems;
}

- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"Container Name: %@ Worth $%d Items: %@ \n", containerName, containerValueInDollars,subItems];
    
    return descriptionString;
}

@end
