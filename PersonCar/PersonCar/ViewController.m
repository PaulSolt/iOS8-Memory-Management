//
//  ViewController.m
//  PersonCar
//
//  Created by Paul Solt on 4/10/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "Person.h"

// Global Variable
Person *globalPerson = nil;

ViewController *newVC = nil;

@interface ViewController () {	// Class Extension (Objc)
	Person *_bob; // Instance variables
}

// Private property (backed by a instance variable: _myFriend)
@property (retain) Person *myFriend;
@property (retain) NSDate *date;

@end

@implementation ViewController

- (void)dealloc {
	// use the instance variable (_)
	[_myFriend release];
	_myFriend = nil;
	
	[_date release];	// Release using ivar (_) not property, so we don't have side effects
	_date = nil;
	
	[super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//	newVC->_bob;  // accessing a instance variable using "->" syntax
//	newVC.myFriend; // accessing a property (that has an instance variable) using dot syntax
	
	// Car and Person are local variables
    Car *car = [[Car alloc] init];			// car: 1
    
    Person *person = [[Person alloc] init]; // person: 1
    person.car = car;       // person owns car  // car: 2
//    [car release];			// Transfering ownership to the person  // car: 1
	
	// We don't want the dealership driving our car unannounced
	car = nil; // Protecting our future self from using the car
	
	[car driveToOhio]; // no-op (nothing happens)
	
	// We have a memory leak!!!!
	
	[person release]; // Both person and car are cleaned up (memory is returned to system)
	
	// person: 0
	// car: 0

	
	// is it autoreleased? Why?
	
	NSString *name = [NSString stringWithFormat:@"%@ %@", @"John", @"Miller"];
	// yes - autorelease
	
	NSDate *today = [NSDate date]; // retain: 0
	// yes
	
	NSDate *now = [NSDate new]; // retain: 1
	// no
	
	NSDate *tomorrow = [NSDate dateWithTimeIntervalSinceNow:60*60*24];
	// yes
	
	NSDate *nextTomorrow = [tomorrow copy]; // retain: 1
	// no
	
	NSArray *words = [@"This sentence is the bomb" componentsSeparatedByString:@" "];
	// yes
	
	NSString *idea = [[NSString alloc] initWithString:@"Hello Ideas"];
	// no
	
	Car *redCar = [Car car];
	// yes

	NSString *idea2 = [[[NSString alloc] initWithString:@"Hello Ideas"] autorelease];
	// yes
	
	[now release];
	[nextTomorrow release];
	[idea release];
	
	
	NSLog(@"idea2: %@", idea2);
	
	//	_date = [today retain];
	self.date = today; 	// retain (property has retain attribute)
	// date is not autoreleased, because we retained a autoreleased variable
	
	
	
	
	
	
	
	
	
	
	
    // Local variables lifetime ends right at the end of the function
} // End of viewDidLoad scope (all local variables go away)

- (void)helperFunction {
	// car and person were local variables, they don't exist here
	//[car release]; 	  // Error: Unknown receiver 'car'; did you mean 'Car'?
	//[person release];   // Error: Unknown receiver 'person'; did you mean 'Person'?
	[_myFriend release];  // Works because _myFriend is an instance variable
}

@end
