//
//  Person.h
//  BloodSugarSimulator
//
//  Created by Kaushal Kantawala on 8/9/15.
//  Copyright (c) 2015 KK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, readwrite) NSString* name;
@property (nonatomic, assign) BOOL influenceOfFood;
@property (nonatomic, assign) BOOL influenceOfExercise;
@property (nonatomic, readwrite) NSTimer* foodTimer;
@property (nonatomic, readwrite) NSTimer* exerciseTimer;

@end