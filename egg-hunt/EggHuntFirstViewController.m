//
//  EggHuntFirstViewController.m
//  egg-hunt
//
//  Created by Travis Palmer on 5/3/14.
//  Copyright (c) 2014 dorkHouse. All rights reserved.
//

#import "EggHuntFirstViewController.h"
#import "Egg.h"

@implementation EggHuntFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(addObject:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
    [self refreshObjects];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self refreshObjects];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshObjects
{
    self.eggs = [Egg MR_findAll];
    [self.tableView reloadData];
}


#pragma mark UITableView methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.eggs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eggCell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    Egg *egg = [self.eggs objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Latitude: %@ Longitude: %@",
                           [egg valueForKey:@"latitude"],
                           [egg valueForKey:@"longitude"]];
}

@end
