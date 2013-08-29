//
//  RotationAppDelegate.h
//  HeavyRotation
//
//  Created by Erin Parker on 4/14/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RotationAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic, getter=isProximityMonitoringEnabled) BOOL proximityMonitoringEnabled;
@property(nonatomic, readonly) BOOL proximityState;
@end

