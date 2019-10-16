//
//  Person.m
//  Manual Reference Counting Demo
//
//  Created by Paul Solt on 4/10/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init {
	if(self = [super init]) {
		
	}
	return self;
}

- (instancetype)initWithCar:(Car *)car {
	if(self = [super init]) {
//		[car retain];
//		_car = car;
		_car = [car retain]; // One line of code
	}
	return self;
}

- (void)dealloc {
	NSLog(@"Person.dealloc");
    [_car release];
	_car = nil;
	[_name release];
	_name = nil;
	
    [super dealloc];
}

- (Car *)car {
    return _car;
}

// BUG!
@synthesize car = _car;
- (void)setCar:(Car *)car {
    [_car release];
    _car = [car retain];
}

@end
