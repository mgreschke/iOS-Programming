//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Erin Parker on 8/25/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BNRItem;

@interface BNRItemStore : NSObject
{
    NSMutableArray *allItems;
    NSMutableArray *allAssetTypes;
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

+ (BNRItemStore *)sharedStore;

- (NSArray *)allItems;
- (BNRItem *)createItem;
- (void)removeItem: (BNRItem *)p;

- (void)moveItemAtIndex: (int)from toIndex:(int)to;

- (NSString *)itemArchivePath;
- (BOOL)saveChanges;

- (void)loadAllItems;

- (NSArray *)allAssetTypes;

@end
