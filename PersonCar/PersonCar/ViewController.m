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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Car *car = [[Car alloc] init];			// car: 1
    
    Person *person = [[Person alloc] init]; // person: 1
    person.car = car;       // person owns car  // car: 2
    [car release];			// Transfering ownership to the person  // car: 1
	
	
	//	car = nil; // Protect my future self
	
	
	
	
	
	
	
	
	
	
	
	
    // CRASH
    // person.car = car;
    
}


@end
