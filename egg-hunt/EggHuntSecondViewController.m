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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addObject
{
    [self persistNewEggWithLatitude:@1234 longitude:@5678];
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

@end
