//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Erin Parker on 4/8/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import "WhereamiViewController.h"

@implementation WhereamiViewController

- (id)initWithNibName: (NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        locationManager = [[CLLocationManager alloc] init];
        
        [locationManager setDelegate:self];
        
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
        [locationManager setDistanceFilter:50];
        
        [locationManager startUpdatingHeading];
        
        [locationManager startUpdatingLocation];
    }
    
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
}

- (void)locationManager: (CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"Your Heading: %@", newHeading);
}

- (void)dealloc
{
    [locationManager setDelegate:nil];
}
@end
