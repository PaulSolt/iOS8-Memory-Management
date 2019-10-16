//
//  Person.h
//  Manual Reference Counting Demo
//
//  Created by Paul Solt on 4/10/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Person : NSObject

// Public Properties
@property (copy) NSString *name;
@property (retain) Car *car;

- (instancetype)initWithCar:(Car *)car;

@end
