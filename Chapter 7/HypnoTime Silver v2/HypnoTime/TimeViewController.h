//
//  TimeViewController.h
//  HypnoTime
//
//  Created by Erin Parker on 4/11/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeViewController : UIViewController
{
    __weak IBOutlet UILabel *timeLabel;
}

- (IBAction)showCurrentTime: (id)sender;

@end
