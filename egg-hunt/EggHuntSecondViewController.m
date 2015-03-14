//
//  EggHuntSecondViewController.m
//  egg-hunt
//
//  Created by Travis Palmer on 5/3/14.
//  Copyright (c) 2014 dorkHouse. All rights reserved.
//

#import "EggHuntSecondViewController.h"
#import "Egg.h"

@implementation EggHuntSecondViewController

#pragma mark
#pragma mark View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addObject
{
    [self persistNewEggWithLatitude:[NSNumber numberWithDouble:self.locationManager.location.coordinate.latitude]
                          longitude:[NSNumber numberWithDouble:self.locationManager.location.coordinate.longitude]];
}

- (void)persistNewEggWithLatitude:(NSNumber *)latitude longitude:(NSNumber *)longitude
{
    // Get the local context
    NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
    
    // Create a new Egg in the current thread context.
    Egg *egg = [Egg MR_createInContext:localContext];
    egg.latitude = latitude;
    egg.longitude = longitude;
    
    // Save the modification in the local context
    // With MagicalRecords 2.0.8 or newer you should use the MR_saveNestedContexts
    [localContext MR_saveToPersistentStoreAndWait];
}


#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *currentLocation = [locations lastObject];
    
    [self.mapView setCenterCoordinate:currentLocation.coordinate
                            zoomLevel:28
                             animated:YES];
}


@end
