//
//  Egg.h
//  egg-hunt
//
//  Created by Travis Palmer on 7/5/14.
//  Copyright (c) 2014 dorkHouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Egg : NSManagedObject

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSManagedObject *picture;

@end
