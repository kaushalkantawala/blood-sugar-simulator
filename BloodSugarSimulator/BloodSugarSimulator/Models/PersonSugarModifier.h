//
//  PersonSugarModifier.h
//  BloodSugarSimulator
//
//  Created by Kaushal Kantawala on 8/10/15.
//  Copyright (c) 2015 KK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonSugarModifier : NSObject

@property (nonatomic, readwrite) id modifier;
@property (nonatomic, readwrite) NSDate* loggingTS;
@property (nonatomic, readwrite) NSDate* expiryTS;

@end
