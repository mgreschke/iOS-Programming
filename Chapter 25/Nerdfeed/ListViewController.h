//
//  ListViewController.h
//  Nerdfeed
//
//  Created by Erin Parker on 5/8/13.
//  Copyright (c) 2013 Spitfire Athlete. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RSSChannel;

@interface ListViewController : UITableViewController <NSXMLParserDelegate> {
    NSURLConnection *connection;
    NSMutableData *xmlData;
    RSSChannel *channel;
}

- (void)fetchEntries;

@end