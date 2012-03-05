//
//  ITRegExpValidator.h
//  ITForm
//
//  Created by mc816 on 03.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITBaseValidator.h"
#define ITFORM_ERROR_NOTMATCH @"notMatch"

@interface ITRegExpValidator : ITBaseValidator

@property (retain) NSString *regexpPattern;

- (id)initWithPattern:(NSString*)pattern;

@end
