//
//  LoggingController.m
//  BloodSugarSimulator
//
//  Created by Kaushal Kantawala on 8/9/15.
//  Copyright (c) 2015 KK. All rights reserved.
//

#import "LoggingController.h"
#import "PersonSugarModifier.h"
#import "AppDefines.h"

@implementation LoggingController

- (void) create
{
    
    NSString* foodItemsFilePath = [NSBundle pathForResource:@"foodItems" ofType:@"plist" inDirectory:[[NSBundle mainBundle] bundlePath]];
    _foodItems = [NSArray arrayWithContentsOfFile:foodItemsFilePath];
    
    NSString* exerciseTypesFilePath = [NSBundle pathForResource:@"exerciseTypes" ofType:@"plist" inDirectory:[[NSBundle mainBundle] bundlePath]];
    _exerciseTypes = [NSArray arrayWithContentsOfFile:exerciseTypesFilePath];
    
    NSString* modifiersFilePath = [NSBundle pathForResource:@"kaushal-2015-08-12" ofType:@"plist" inDirectory:[[NSBundle mainBundle] bundlePath]];
    _modifiers = [NSArray arrayWithContentsOfFile:modifiersFilePath];
    
    NSArray* sortedModifiers = [_modifiers sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        
        NSDate* first = (NSDate *)[((NSDictionary *)a) valueForKey:@"LoggingTS"];
        NSDate* second = (NSDate *)[((NSDictionary *)b) valueForKey:@"LoggingTS"];
        
        return [first compare:second];
        
    }];
    
    _modifiers = sortedModifiers;
    
    _loggingStartTS = (NSDate *)[[_modifiers firstObject] valueForKey:@"LoggingTS"];
    _loggingEndTS = (NSDate *)[[_modifiers lastObject] valueForKey:@"LoggingTS"];
    
    _person = [[Person alloc] initPersonWithName:@"Kaushal" atTime:[NSDate dateWithTimeInterval:-300 sinceDate:_loggingStartTS]];
}

- (void) logFood:(NSString *)foodName atTime:(NSDate *)time forPerson:(Person *)person
{
    NSMutableDictionary* foodItem = nil;
    
    for (foodItem in _foodItems)
    {
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
    NSMutableDictionary* exerciseTypeItem = nil;
    
    for (exerciseTypeItem in _exerciseTypes)
    {        
        if ([(NSString *)[exerciseTypeItem valueForKey:@"Exercise"] isEqualToString:exerciseType])
            break;
    }
    
    // Check if exercise type is not found
    
    float EI = [[exerciseTypeItem valueForKey:@"Exercise Index"] floatValue];
    
    Exercise* exercise = [[Exercise alloc] initWithExerciseName:exerciseType andExerciseIndex:EI];
    
    [person logExercise:exercise atTime:time];
    
}

- (void) logModifiersForPerson:(Person *)person
{
    NSDictionary* modifierItem = nil;
    
    for (modifierItem in _modifiers)
    {
        if ([[modifierItem valueForKey:@"Type"] isEqualToString:@"Food"])
        {
            [self logFood:[modifierItem valueForKey:@"Name"]
                   atTime:(NSDate *)[modifierItem objectForKey:@"LoggingTS"]
                forPerson:person];
        }
        else if ([[modifierItem valueForKey:@"Type"] isEqualToString:@"Exercise"])
        {
            [self logExercise:[modifierItem valueForKey:@"Name"]
                       atTime:[modifierItem objectForKey:@"LoggingTS"]
                    forPerson:person];
        }
    }
}

- (void) displayBloodSugarLevels
{
    [self logModifiersForPerson:_person];
    
    NSDate* displayTime = [NSDate dateWithTimeInterval:-(SECS_PER_MIN*10) sinceDate:_loggingStartTS];
    
    while (displayTime < [NSDate dateWithTimeInterval:(SECS_PER_HOUR*3) sinceDate:_loggingEndTS])
    {
        [_person calculateBloodSugar:displayTime];
        displayTime = [NSDate dateWithTimeInterval:(SECS_PER_MIN*5) sinceDate:displayTime];
    }
}

@end
