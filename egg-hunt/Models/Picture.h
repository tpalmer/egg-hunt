//
//  Picture.h
//  egg-hunt
//
//  Created by Travis Palmer on 7/5/14.
//  Copyright (c) 2014 dorkHouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Egg;

@interface Picture : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Egg *egg;

@end
