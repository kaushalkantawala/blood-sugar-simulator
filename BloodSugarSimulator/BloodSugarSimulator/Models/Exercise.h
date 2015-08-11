//
//  Exercise.h
//  BloodSugarSimulator
//
//  Created by Kaushal Kantawala on 8/9/15.
//  Copyright (c) 2015 KK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BloodSugarModifier.h"

@interface Exercise : BloodSugarModifier

@property (nonatomic, readwrite) NSString* exerciseName;

- (instancetype) initWithExerciseName:(NSString *)exerciseName andExerciseIndex:(float)exerciseIndex;

@end
