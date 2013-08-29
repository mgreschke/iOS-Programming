//
//  ListViewController.m
//  Nerdfeed
//
//  Created by Erin Parker on 8/28/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "ListViewController.h"
#import "RSSChannel.h"
#import "RSSItem.h"
#import "BNRFeedStore.h"

@implementation ListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self) {
        
        UISegmentedControl *rssTypeControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"BNR", @"Apple", nil]];
        [rssTypeControl setSelectedSegmentIndex:0];
        [rssTypeControl addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventValueChanged];
        [[self navigationItem] setTitleView:rssTypeControl];
        
        [self fetchEntries];
    }
    
    return self;
}

- (void)changeType:(id)sender
{
    rssType = [sender selectedSegmentIndex];
    [self fetchEntries];
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection: (NSInteger)section
{
    return [[channel items] count];
}

- (UITableViewCell *)tableView: (UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    RSSItem *item = [[channel items] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[item title]];
    
    if ([[BNRFeedStore sharedStore] hasItemBeenRead:item]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    } else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RSSItem *entry = [[channel items] objectAtIndex:[indexPath row]];
    [[BNRFeedStore sharedStore] markItemAsRead:entry];
    
    [[[self tableView] cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
}

- (void)fetchEntries
{
    UIView *currentTitleView = [[self navigationItem] titleView];
    UIActivityIndicatorView *aiView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    [[self navigationItem] setTitleView:aiView];
    [aiView startAnimating];
    
    void (^completionBlock)(RSSChannel *obj, NSError *err) = ^(RSSChannel *obj, NSError *err) {
        
        [[self navigationItem] setTitleView:currentTitleView];
        
        if (!err) {
            channel = obj;
            [[self tableView] reloadData];
        } else {
            NSString *errorString = [NSString stringWithFormat:@"Fetch failed: %@", [err localizedDescription]];
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [av show];
        }
    };

    if (rssType == ListViewControllerRSSTypeBNR) {
        channel = [[BNRFeedStore sharedStore] fetchRSSFeedWithCompletion:^(RSSChannel *obj, NSError *err) {
            [[self navigationItem] setTitleView:currentTitleView];
            
            if (!err) {
                int currentItemCount = [[channel items] count];

                channel = obj;
                
                int newItemCount = [[channel items] count];
                
                // For each new item, insert a new row
                int itemDelta = newItemCount - currentItemCount;
                if (itemDelta > 0) {
                    NSMutableArray *rows = [NSMutableArray array];
                    
                    for (int i = 0; i < itemDelta; i++) {
                        NSIndexPath *ip = [NSIndexPath indexPathForRow:i inSection:0];
                        
                        [rows addObject:ip];
                    }
                    
                    [[self tableView] insertRowsAtIndexPaths:rows withRowAnimation:UITableViewRowAnimationTop];
                }
            }
        }];
        
        [[self tableView] reloadData];
    } else if (rssType == ListViewControllerRSSTypeApple)
        [[BNRFeedStore sharedStore] fetchTopSongs:10 withCompletion:completionBlock];
}

@end
