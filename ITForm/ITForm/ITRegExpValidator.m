//
//  ITRegExpValidator.m
//  ITForm
//
//  Created by mc816 on 03.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITRegExpValidator.h"

@implementation ITRegExpValidator
@synthesize regexpPattern;

- (id)initWithPattern:(NSString*)pattern
{
    self = [self init];
    if (self) {
        self.regexpPattern = pattern;
    }
    return self;
}

- (void)dealloc
{
    [regexpPattern release];
    [super dealloc];
}

- (BOOL)checkValue:(NSString*)value
{
    if (self.regexpPattern != nil && ![self.regexpPattern isEqualToString:@""]) {
         NSPredicate *testPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", self.regexpPattern];
        if (![testPredicate evaluateWithObject:value]) {
            self.lastError = [self getErrorByCode:@"notMatch"];
            return NO;
        }
    }
    return YES;
}

- (void)setupErrorMessages
{
    self.errorMessages = [NSDictionary dictionaryWithObject:@"Value not match" forKey:@"notMatch"];
}

- (BOOL)isEqualToValidator:(ITRegExpValidator*)otherValidator
{
    BOOL result = [super isEqualToValidator:otherValidator];
    if (result && [otherValidator isKindOfClass:[self class]]) {
        result = [self.regexpPattern isEqualToString:[otherValidator regexpPattern]];
    }
    return result;
}

@end
