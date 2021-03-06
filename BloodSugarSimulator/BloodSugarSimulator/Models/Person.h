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
@property (nonatomic, assign) NSDate* lastCalculationTime;
@property (nonatomic, assign) BOOL influenceOfFood;
@property (nonatomic, assign) BOOL influenceOfExercise;
@property (nonatomic, readwrite) NSTimer* foodTimer;
@property (nonatomic, readwrite) NSTimer* exerciseTimer;
@property (nonatomic, readwrite) NSMutableArray* personSugarModifiers;
@property (nonatomic, readwrite) NSMutableArray* activeSugarModifiers;
@property (nonatomic, readwrite) float bloodSugarLevel;
@property (nonatomic, readwrite) float glycationLevel;

- (instancetype) initPersonWithName:(NSString *)name atTime:(NSDate *)time;
- (float) getCurrentBloodSugar:(NSDate *)time;
- (float) getGlycation:(NSDate *)time;
- (void) logFood:(Food *)foodItem atTime:(NSDate *)time;
- (void) logExercise:(Exercise *)exerciseType atTime:(NSDate *)time;
- (void) calculateBloodSugar:(NSDate *) time;

@end
