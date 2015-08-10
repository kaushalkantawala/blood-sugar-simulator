//
//  LoggingController.h
//  BloodSugarSimulator
//
//  Created by Kaushal Kantawala on 8/9/15.
//  Copyright (c) 2015 KK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIViewController.h>
#import "Person.h"
#import "Food.h"
#import "Exercise.h"

@interface LoggingController : UIViewController

@property (nonatomic, readwrite) NSArray* foodItems;
@property (nonatomic, readwrite) NSArray* exerciseTypes;

- (void) create;
- (void) logFood:(NSString *)foodName atTime:(NSDate *)time forPerson:(Person *)person;
- (void) logExercise:(NSString *)exerciseType atTime:(NSDate *)time forPerson:(Person *)person;

@end
