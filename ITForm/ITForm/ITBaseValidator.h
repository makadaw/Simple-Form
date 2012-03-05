//
//  ITBaseValidator.h
//  ITForm
//
//  Created by mc816 on 03.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITBaseValidator : NSObject

@property (retain) NSString *lastError;
@property (retain) NSDictionary *errorMessages;

- (BOOL)checkValue:(NSString*)value;
- (NSString*)getErrorByCode:(NSString*)code;

- (BOOL)isEqualToValidator:(ITBaseValidator*)otherValidator;
- (void)setErrorMessage:(NSString*)message forKey:(NSString*)key;

@end
