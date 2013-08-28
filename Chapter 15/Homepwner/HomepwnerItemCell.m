//
//  HomepwnerItemCell.m
//  Homepwner
//
//  Created by Erin Parker on 8/26/13.
//  Copyright (c) 2013 Erin Parker. All rights reserved.
//

#import "HomepwnerItemCell.h"

@implementation HomepwnerItemCell
@synthesize thumbnailView, nameLabel, serialNumberLabel, valueLabel, controller, tableView;

- (IBAction)showImage:(id)sender
{
    NSString *selector = NSStringFromSelector(_cmd);
    selector = [selector stringByAppendingString:@"atIndexPath:"];
    
    SEL newSelector = NSSelectorFromString(selector);
    
    NSIndexPath *indexPath = [[self tableView] indexPathForCell:self];
    if (indexPath) {
        if ([[self controller] respondsToSelector:newSelector]) {
            [[self controller] performSelector:newSelector
                                    withObject:sender
                                    withObject:indexPath];
        }
    }
}
@end
