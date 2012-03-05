//
//  ITRequiredValidator.m
//  ITForm
//
//  Created by mc816 on 03.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITRequiredValidator.h"

@implementation ITRequiredValidator

- (BOOL)checkValue:(NSString*)value
{
    if (value == nil || [value isEqualToString:@""]) {
        self.lastError = [self getErrorByCode:ITFORM_ERROR_REQUIRED];
        return NO;
    }
    return YES;
}

- (void)setupErrorMessages
{
    self.errorMessages = [NSDictionary dictionaryWithObject:@"This field is required" forKey:ITFORM_ERROR_REQUIRED];
}

@end
