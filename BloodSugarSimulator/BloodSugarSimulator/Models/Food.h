//
//  Food.h
//  BloodSugarSimulator
//
//  Created by Kaushal Kantawala on 8/9/15.
//  Copyright (c) 2015 KK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BloodSugarModifier.h"

@interface Food : BloodSugarModifier


@property (nonatomic, readwrite) NSString* foodName;

- (instancetype) initWithFoodName:(NSString *)foodName andGlycemicIndex:(float)glycemicIndex;

@end
