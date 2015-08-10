//
//  LoggingController.m
//  BloodSugarSimulator
//
//  Created by Kaushal Kantawala on 8/9/15.
//  Copyright (c) 2015 KK. All rights reserved.
//

#import "LoggingController.h"

@implementation LoggingController

- (void) create
{
    
    NSString* foodItemsFilePath = [NSBundle pathForResource:@"foodItems" ofType:@"plist" inDirectory:[[NSBundle mainBundle] bundlePath]];
    _foodItems = [NSArray arrayWithContentsOfFile:foodItemsFilePath];
    
    NSString* exerciseTypesFilePath = [NSBundle pathForResource:@"exerciseTypes" ofType:@"plist" inDirectory:[[NSBundle mainBundle] bundlePath]];
    _exerciseTypes = [NSArray arrayWithContentsOfFile:exerciseTypesFilePath];

}

- (void) logFood:(NSString *)foodName atTime:(NSDate *)time forPerson:(Person *)person
{
    NSMutableDictionary* foodItem = nil;
    
    for (foodItem in _foodItems)
    {
        NSLog(@"Name: %@",[foodItem valueForKey:@"Name"]);
        
        if ([(NSString *)[foodItem valueForKey:@"Name"] isEqualToString:foodName])
             break;
    }
    // Check if food item is not found
    
    float GI = [[foodItem valueForKey:@"Glycemic Index"] floatValue];
    
    Food* food = [[Food alloc] initWithFoodName:foodName andGlycemicIndex:GI];
    
    [person logFood:food atTime:time];
}

- (void) logExercise:(NSString *)exerciseType atTime:(NSDate *)time forPerson:(Person *)person
{

}


@end
