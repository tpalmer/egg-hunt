//
//  EggDetailViewController.h
//  egg-hunt
//
//  Created by Travis Palmer on 3/14/15.
//  Copyright (c) 2015 dorkHouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Egg.h"

@interface EggDetailViewController : UIViewController

@property(nonatomic, strong) Egg *egg;
@property(nonatomic, weak) IBOutlet UILabel *lattitude;
@property(nonatomic, weak) IBOutlet UILabel *longitude;

@end
