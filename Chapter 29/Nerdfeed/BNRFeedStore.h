//
//  BNRFeedStore.h
//  Nerdfeed
//
//  Created by Erin Parker on 8/28/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RSSChannel, RSSItem;

@interface BNRFeedStore : NSObject
{
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

+ (BNRFeedStore *)sharedStore;

@property (nonatomic, strong) NSDate *topSongsCacheDate;

- (RSSChannel *)fetchRSSFeedWithCompletion: (void (^) (RSSChannel *obj, NSError *err))block;

- (void)fetchTopSongs:(int)count withCompletion:(void (^)(RSSChannel *obj, NSError *err))block;

- (void)markItemAsRead: (RSSItem *)item;
- (BOOL)hasItemBeenRead: (RSSItem *)item;
@end
