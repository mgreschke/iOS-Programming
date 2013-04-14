//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Erin Parker on 4/13/13.
//  Copyright (c) 2013 com.bignerdranch. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@interface HypnosisViewController ()

@property (nonatomic, weak) HypnosisView *hypnoView;

@end

@implementation HypnosisViewController

- (void)loadView
{
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView *v = [[HypnosisView alloc] initWithFrame:frame];
    
    [self setHypnoView:v];
    [self setView:[self hypnoView]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Hypnosis"];
        
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        [tbi setImage:i];
    }
    return self;
}

- (void)createControls
{
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Red", @"Green", @"Blue", nil]];
    
    segmentedControl.segmentedControlStyle = UISegmentedControlStylePlain;
    
    [segmentedControl addTarget:self action:@selector(createControls:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segmentedControl];
}

- (IBAction)createControls:(id)sender
{
    
    switch (((UISegmentedControl *)sender).selectedSegmentIndex)
    {
        case 0:
        {
            NSLog(@"Red Color");
            [[self hypnoView] setCircleColor:[UIColor redColor]];
            break;
        }
        case 1:
        {
            NSLog(@"Green Color");
            [[self hypnoView] setCircleColor:[UIColor greenColor]];
            break;
        }
        default:
        {
            NSLog(@"Blue Color");
            [[self hypnoView] setCircleColor:[UIColor blueColor]];
            break;
        }
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"HypnosisViewController loaded its view.");
    [self createControls];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
