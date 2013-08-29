//
//  BNRItem.m
//  RandomPossessions
//
//  Created by Erin Parker on 4/6/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem
@synthesize itemName;
@synthesize containedItem, container, serialNumber, valueInDollars, dateCreated;
@synthesize imageKey;

+ (id)randomItem
{
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Hot", @"Sexy", @"Cool", nil];
    
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Dragon", @"Gar", @"Owl", nil];
    
    NSInteger adjectiveIndex = rand () % [randomAdjectiveList count];
    NSInteger nounIndex = rand () % [randomNounList count];

    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = rand() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c",
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10,
                                    'A' + rand() % 26];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                                       valueInDollars:randomValue serialNumber:randomSerialNumber];
    
    return newItem;
    
    
}


- (id)initWithItemName: (NSString *)name
        valueInDollars: (int)value
          serialNumber: (NSString *)sNumber
{
    self = [super init];
    
    if (self) {
    [self setItemName:name];
    [self setSerialNumber:sNumber];
    [self setValueInDollars:value];
    dateCreated = [[NSDate alloc] init];
    }
    
    return self;
}

- (id)initWithItemName:(NSString *)name
          serialNumber:(NSString *)sNumber
{
    return [self initWithItemName:name
                   valueInDollars:278
                     serialNumber:sNumber];

}

- (void)setContainedItem:(BNRItem *)i
{
    containedItem = i;
    [i setContainer:self];
}

@end
