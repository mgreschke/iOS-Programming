//
//  ListViewController.h
//  Nerdfeed
//
//  Created by Erin Parker on 8/28/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RSSChannel;

typedef enum {
 ListViewControllerRSSTypeBNR,
 ListViewControllerRSSTypeApple
} ListViewControllerRSSType;

@interface ListViewController : UITableViewController <NSXMLParserDelegate>
{
    RSSChannel *channel;
    ListViewControllerRSSType rssType;
}

- (void)fetchEntries;
@end
