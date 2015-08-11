//
//  Person.m
//  BloodSugarSimulator
//
//  Created by Kaushal Kantawala on 8/9/15.
//  Copyright (c) 2015 KK. All rights reserved.
//

#import "Person.h"
#import "AppDefines.h"
#import "PersonSugarModifier.h"

@implementation Person


- (instancetype) initPersonWithName:(NSString *)name atTime:(NSDate *)time
{
    self = [super init];
    
    self.name = name;
    self.initializationTime = time;
    
    _personSugarModifiers = [NSMutableArray new];
    _bloodSugarLevel = 80.0;
    
    return self;
}

- (float) getCurrentBloodSugar:(NSDate *)time
{
    return 0.0;
}

- (float) getGlycation:(NSDate *)time
{
    return 0.0;
}

- (void) logFood:(Food *)foodItem atTime:(NSDate *)time
{
    PersonSugarModifier* loggedItem = [PersonSugarModifier new];
    
    loggedItem.modifier = foodItem;
    loggedItem.loggingTS = time;
    loggedItem.expiryTS = [NSDate dateWithTimeInterval:(SECS_PER_HOUR*2) sinceDate:time];
    
    [_personSugarModifiers addObject:loggedItem];
}

- (void) logExercise:(Exercise *)exerciseType atTime:(NSDate *)time
{
    PersonSugarModifier* loggedItem = [PersonSugarModifier new];
    
    loggedItem.modifier = exerciseType;
    loggedItem.loggingTS = time;
    loggedItem.expiryTS = [NSDate dateWithTimeInterval:SECS_PER_HOUR sinceDate:time];
    
    [_personSugarModifiers addObject:loggedItem];
}


#pragma mark internal routines

- (float) calculateBloodSugar:(NSDate *)time
{
    PersonSugarModifier* modifierItem;
    
    for (modifierItem in _personSugarModifiers)
    {
//      Check if current time is after expiryTS. If yes, calculate resulting bloodSugar change from modifier
        if (modifierItem.expiryTS > time)
        {
            if ([modifierItem.modifier isKindOfClass:[Food class]])
            {
                Food* foodItem = (Food *)modifierItem.modifier;
                _bloodSugarLevel += foodItem.bloodSugarChangePerMinute*MINS_PER_HOUR*2;
            }
            else if ([modifierItem.modifier isKindOfClass:[Exercise class]])
            {
                Exercise* exerciseItem = (Exercise *)modifierItem.modifier;
                _bloodSugarLevel -= exerciseItem.bloodSugarChangePerMinute*MINS_PER_HOUR;
            }
        }
        else
//      Calculate current rate of change of blood sugar per min
        {
            
        }
    }
    
}

- (float) calculateGlycation:(NSDate *)time
{
    return 0.0;
}

@end
