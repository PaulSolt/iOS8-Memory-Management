//
//  Car.m
//  Manual Reference Counting Demo
//
//  Created by Paul Solt on 4/10/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "Car.h"

@implementation Car

//[Date date]; // current date
//[Car car];

// Naming convention (rule) that you name your Class functions using the type
// Car -> car

+ (Car *)car {
	return [[[Car alloc] init] autorelease];
}

//+ (Car *)carWithYear:(int)year {
//	return [[[Car alloc] initWithYear:year] autorelease];
//}

- (void)driveToOhio {
	
	
}

- (void)dealloc {
	NSLog(@"Car.dealloc");
	
	[super dealloc];
}

@end
