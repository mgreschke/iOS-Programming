//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Erin Parker on 4/8/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
    CLLocationManager *locationManager;
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
    __weak IBOutlet UISegmentedControl *mapTypeControl;
}
- (IBAction)changeMapType:(id)sender;

- (void)findLocation;
- (void)foundLocation: (CLLocation *)loc;

@end
