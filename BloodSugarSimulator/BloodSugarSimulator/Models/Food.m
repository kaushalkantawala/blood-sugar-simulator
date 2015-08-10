//
//  Food.m
//  BloodSugarSimulator
//
//  Created by Kaushal Kantawala on 8/9/15.
//  Copyright (c) 2015 KK. All rights reserved.
//

#import "Food.h"
#import "AppDefines.h"

@implementation Food

- (instancetype) initWithFoodName:(NSString *)foodName andGlycemicIndex:(float)glycemicIndex
{
    self = [super init];
    
    _foodName = foodName;
    self.bloodSugarChangePerMinute = glycemicIndex/(MINS_PER_HOUR*2);
    
    return self;
}

@end
