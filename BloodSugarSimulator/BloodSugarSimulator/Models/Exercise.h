//
//  Exercise.h
//  BloodSugarSimulator
//
//  Created by Kaushal Kantawala on 8/9/15.
//  Copyright (c) 2015 KK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exercise : NSObject

@property (nonatomic, readonly) NSString* exerciseName;
@property (nonatomic, readonly) NSInteger exerciseBloodSugarChangePerHour;



@end