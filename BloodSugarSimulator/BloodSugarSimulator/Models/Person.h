//
//  Person.h
//  BloodSugarSimulator
//
//  Created by Kaushal Kantawala on 8/9/15.
//  Copyright (c) 2015 KK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Food.h"
#import "Exercise.h"

@interface Person : NSObject

@property (nonatomic, readwrite) NSString* name;
@property (nonatomic, readonly) NSDate* initializationTime;
@property (nonatomic, assign) BOOL influenceOfFood;
@property (nonatomic, assign) BOOL influenceOfExercise;
@property (nonatomic, readwrite) NSTimer* foodTimer;
@property (nonatomic, readwrite) NSTimer* exerciseTimer;
@property (nonatomic, readwrite) NSMutableArray* bloodSugarModifiers;

- (float) getCurrentBloodSugar:(NSDate *)time;
- (float) getGlycation:(NSDate *)time;
- (void) logFood:(Food *)foodItem atTime:(NSDate *)time;
- (void) logExercise:(Exercise *)exerciseType atTime:(NSDate *)time;

@end
