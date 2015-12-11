//
//  Doctor.m
//  NotificationTest
//
//  Created by Nikolay Berlioz on 15.09.15.
//  Copyright (c) 2015 Nikolay Berlioz. All rights reserved.
//

#import "Doctor.h"
#import "Goverment.h"

@implementation Doctor

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(salaryChangedNotification:)
                                                     name:GovermentSalaryDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(averagePriceChangedNotification:)
                                                     name:GovermentAveragePriceDidChangeNotification
                                                   object:nil];
    }
    return self;
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification

- (void) salaryChangedNotification: (NSNotification*) notification
{
    NSNumber *value = [notification.userInfo objectForKey:GovermentSalaryUserInfoKey];
    
    CGFloat salary = [value floatValue];
    
    if (salary < self.salary)
    {
        NSLog(@"Doctors are not happy!");
    }
    else
    {
        NSLog(@"Doctors are happy!");
    }
    
    self.salary = salary;
}

- (void) averagePriceChangedNotification: (NSNotification*) notification
{
    
}


@end
