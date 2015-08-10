//
//  Person.m
//  BloodSugarSimulator
//
//  Created by Kaushal Kantawala on 8/9/15.
//  Copyright (c) 2015 KK. All rights reserved.
//

#import "Person.h"

@implementation Person


- (instancetype) initPersonWithName:(NSString *)name atTime:(NSDate *)time
{
    self = [super init];
    
    self.name = name;
    self.initializationTime = time;
    
    return self;
}

- (float) getCurrentBloodSugar:(NSDate *)time
{
    return 0.0;
}

- (float) getGlycation:(NSDate *)time
{
    return 0.0;
}

- (void) logFood:(Food *)foodItem atTime:(NSDate *)time
{

}

- (void) logExercise:(Exercise *)exerciseType atTime:(NSDate *)time
{}


#pragma mark internal routines

- (float) calculateBloodSugar:(NSDate *)time
{
    return 0.0;
}

- (float) calculateGlycation:(NSDate *)time
{
    return 0.0;
}

@end
