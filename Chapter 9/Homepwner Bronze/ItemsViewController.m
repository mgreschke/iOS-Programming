//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Erin Parker on 4/15/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import "ItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation ItemsViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger i = 0;
    if([[[BNRItemStore sharedStore] expensiveItems] count] > 0) i++;
    if([[[BNRItemStore sharedStore] cheapItems] count] > 0) i++;
    return i;
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [[[BNRItemStore sharedStore] cheapItems] count];
            break;
        case 1:
            return [[[BNRItemStore sharedStore] expensiveItems] count];
            break;
        default:
            return section;
            break;
    }
}


- (UITableViewCell *)tableView: (UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
      
    }
    
    if ([indexPath section] == 0) {
        BNRItem *p = [[[BNRItemStore sharedStore] cheapItems] objectAtIndex:[indexPath row]];
        [[cell textLabel] setText:[p description]];
    } else {
        BNRItem *p = [[[BNRItemStore sharedStore] expensiveItems] objectAtIndex:[indexPath row]];
        [[cell textLabel] setText:[p description]];
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Cheap Stuff";
            break;
            
        case 1:
            return @"Expensive Stuff";
            break;
            
        default:
            break;
    }
    return nil;
}


@end
