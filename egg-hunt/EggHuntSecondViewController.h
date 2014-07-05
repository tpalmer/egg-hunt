//
//  EggHuntSecondViewController.h
//  egg-hunt
//
//  Created by Travis Palmer on 5/3/14.
//  Copyright (c) 2014 dorkHouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface EggHuntSecondViewController : UIViewController<MKMapViewDelegate>

- (IBAction)addObject;

- (void)persistNewEggWithLatitude:(NSNumber *)latitude longitude:(NSNumber *)longitude;

@end
