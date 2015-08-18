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
    self.lastCalculationTime = time;
    
    _personSugarModifiers = [NSMutableArray new];
    _activeSugarModifiers = [NSMutableArray new];
    _bloodSugarLevel = initialBloodSugar;
    _glycationLevel = initialGlycationLevel;
    
    self.influenceOfExercise = NO;
    self.influenceOfFood = NO;
    
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

- (void) adjustActiveModifiers:(NSDate *) time
{
    PersonSugarModifier* modifierItem = nil;
    
    NSMutableArray* iterableActiveModifiers = [NSMutableArray arrayWithArray:_activeSugarModifiers];
    NSMutableArray* iterablePersonSugarModifiers = [NSMutableArray arrayWithArray:_personSugarModifiers];
    
    for (modifierItem in iterableActiveModifiers)
    {
        if ([time timeIntervalSinceDate:modifierItem.expiryTS] >= 0)
        {
            [_activeSugarModifiers removeObject:modifierItem];
        }
    }
    
    for (modifierItem in iterablePersonSugarModifiers)
    {
        if (([time timeIntervalSinceDate:modifierItem.loggingTS] >= 0) &&
            ([modifierItem.expiryTS timeIntervalSinceDate:time] > 0))
        {
            [_activeSugarModifiers addObject:modifierItem];
            [_personSugarModifiers removeObject:modifierItem];
        }
    }
}

- (void) calculateBloodSugar:(NSDate *) time
{
    [self adjustActiveModifiers:time];
    
    PersonSugarModifier* modifierItem;
    
    float secsPastLastCalculation = [time timeIntervalSinceDate:_lastCalculationTime];
    
    float minsPastLastCalculation = secsPastLastCalculation > 0 ? secsPastLastCalculation/60 : 0;
    
    if ([_activeSugarModifiers count] == 0)
    {
        _bloodSugarLevel -= 1 * minsPastLastCalculation;
        
        if (_bloodSugarLevel < 80)
        {
            _bloodSugarLevel = 80;
        }
    }
    else
    {
        for (modifierItem in _activeSugarModifiers)
        {
            if ([modifierItem.modifier isKindOfClass:[Food class]])
            {
                Food* foodItem = (Food *)modifierItem.modifier;
                _bloodSugarLevel += foodItem.bloodSugarChangePerMinute * minsPastLastCalculation;
            }
            else if ([modifierItem.modifier isKindOfClass:[Exercise class]])
            {
                Exercise* exerciseItem = (Exercise *)modifierItem.modifier;
                _bloodSugarLevel -= exerciseItem.bloodSugarChangePerMinute * minsPastLastCalculation;
            }
        }
    }
    
    if (_bloodSugarLevel >= 150)
    {
        _glycationLevel += minsPastLastCalculation * glycationChangePerMinute;
    }
    
    NSLog (@"Time: %@  Blood Sugar: %f  Glycation: %f",time,_bloodSugarLevel,_glycationLevel);
    
    _lastCalculationTime = time;
}

@end
