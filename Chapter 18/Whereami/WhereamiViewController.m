//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Erin Parker on 4/8/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import "WhereamiViewController.h"
#import "BNRMapPoint.h"

NSString * const WhereamiMapTypePrefKey = @"WhereamiMapTypePrefKey";

@implementation WhereamiViewController

+ (void)initialize
{
    NSDictionary *defaults = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:1] forKey:WhereamiMapTypePrefKey];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
}

- (id)initWithNibName: (NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        locationManager = [[CLLocationManager alloc] init];
        
        [locationManager setDelegate:self];
        
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Map"];
        
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        [tbi setImage:i];
    }
    
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
    
    // How many seconds ago was this new location created?
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    
    // If location made more than 3 minutes ago, ignore it, keep looking
    if (t < -180) {
        return;
    }
    
    [self foundLocation:newLocation];
}

- (void)locationManager: (CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}

- (void)viewDidLoad
{
    [worldView setShowsUserLocation:YES];
    
    NSInteger mapTypeValue = [[NSUserDefaults standardUserDefaults] integerForKey:WhereamiMapTypePrefKey];
    
    [mapTypeControl setSelectedSegmentIndex:mapTypeValue];
    
    [self changeMapType:mapTypeControl];
}

- (void)dealloc
{
    [locationManager setDelegate:nil];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:NO];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)changeMapType:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] setInteger:[sender selectedSegmentIndex] forKey:WhereamiMapTypePrefKey];
    
    switch ([sender selectedSegmentIndex]) {
        case 0:
        {
            [worldView setMapType:MKMapTypeStandard];
        } break;
        case 1:
        {
            [worldView setMapType:MKMapTypeSatellite];
        } break;
        case 2:
        {
            [worldView setMapType:MKMapTypeHybrid];
        } break;
        
    }

}

- (void)findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

- (void)foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    
    // Create instance of BNRMapPoint with current data
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord title:[locationTitleField text]];

    [worldView addAnnotation:mp];
    
    // Zoom the region to this location
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:NO];
    
    // Reset the UI
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}


@end
