//
//  ITBaseValidator.m
//  ITForm
//
//  Created by mc816 on 03.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITBaseValidator.h"

@interface ITBaseValidator()
- (void)setupErrorMessages;
@end

@implementation ITBaseValidator
@synthesize lastError, errorMessages;

#pragma mark - Lifecycle
- (id)init
{
    self = [super init];
    if (self) {
        [self setupErrorMessages];
    }
    return self;
}

- (void)dealloc
{
    [self.lastError release];
    [self.errorMessages release];
    [super dealloc];
}

//Call this method to set up default error messages
- (void)setupErrorMessages
{
}

- (void)setErrorMessage:(NSString*)message forKey:(NSString*)key
{
    NSMutableDictionary *newErrors = [[NSMutableDictionary alloc] initWithDictionary:errorMessages];
    [newErrors setObject:message forKey:key];
    errorMessages = newErrors;
    [newErrors release];
}

#pragma mark - Validate part
- (BOOL)checkValue:(NSString*)value
{
    //Base validator will always return YES!
    return YES;
}

- (NSString*)getErrorByCode:(NSString*)code
{
    return [self.errorMessages objectForKey:code];
}

#pragma mark - System part
- (BOOL)isEqual:(id)object
{
    if (object == self) {
        return YES;
    }
    if (!object || ![object isKindOfClass:[self class]]) {
        return NO;
    }
    return [self isEqualToValidator:object];
}

//This method may rewrite in child validators
- (BOOL)isEqualToValidator:(ITBaseValidator*)otherValidator
{
    if (self == otherValidator) {
        return YES;
    }
    if ([self class] == [otherValidator class]) {
        return YES;
    }
    return NO;
}

@end
