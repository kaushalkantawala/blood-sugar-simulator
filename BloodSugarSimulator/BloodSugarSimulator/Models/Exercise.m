//
//  Exercise.m
//  BloodSugarSimulator
//
//  Created by Kaushal Kantawala on 8/9/15.
//  Copyright (c) 2015 KK. All rights reserved.
//

#import "Exercise.h"
#import "AppDefines.h"

@implementation Exercise

- (instancetype) initWithExerciseName:(NSString *)exerciseName andExerciseIndex:(float)exerciseIndex
{
    self = [super init];
    
    _exerciseName = exerciseName;
    self.bloodSugarChangePerMinute = exerciseIndex/MINS_PER_HOUR;
    
    return self;
}

@end
