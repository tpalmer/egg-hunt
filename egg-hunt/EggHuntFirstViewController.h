//
//  EggHuntFirstViewController.h
//  egg-hunt
//
//  Created by Travis Palmer on 5/3/14.
//  Copyright (c) 2014 dorkHouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EggHuntFirstViewController : UITableViewController

@property(nonatomic, strong) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSArray *eggs;

- (void)refreshObjects;

@end
