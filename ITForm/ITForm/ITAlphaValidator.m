//
//  ITAlphaValidator.m
//  ITForm
//
//  Created by mc816 on 03.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITAlphaValidator.h"

@implementation ITAlphaValidator

- (BOOL)checkValue:(NSString*)value
{
    self.regexpPattern = @"[\\w\\s]";
    return [super checkValue:value];
}

- (void)setupErrorMessages
{
    self.errorMessages = [NSDictionary dictionaryWithObject:@"Value not alpha" forKey:@"notMatch"];
}

@end
