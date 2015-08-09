//
//  Food.h
//  BloodSugarSimulator
//
//  Created by Kaushal Kantawala on 8/9/15.
//  Copyright (c) 2015 KK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject


@property (nonatomic, readonly) NSString* foodName;
@property (nonatomic, readonly) NSInteger foodGlycemicIndex;


- (float) getRateOfChangeOfBloodSugarPerMin;

@end
