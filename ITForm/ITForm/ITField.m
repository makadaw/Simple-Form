//
//  ITField.m
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITField.h"

@interface ITField()

@end

@implementation ITField
@synthesize fieldName, editable;
@synthesize responderDelegate, delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.editable = YES;
        [self postInit];
    }
    return self;
}

- (id)initWithFieldName:(NSString*)theFieldName
{
    self = [self initWithFrame:CGRectZero];
    if (self) {
        self.fieldName = theFieldName;
    }
    return self;
}

- (void)dealloc
{
    [self.fieldName release];
    [super dealloc];
}

- (void)postInit
{
    
}

- (void)viewDidAddedToForm
{
    
}

- (void)setFrame:(CGRect)frame
{
    float height = [self fieldHeight];
    if (frame.size.height < height) {
        frame.size.height = height;
    }
    [super setFrame:frame];
}

- (CGFloat)fieldHeight
{
    return 88.0;
}

- (void)setFieldValue:(NSString *)newValue
{
    NSAssert(YES, @"Implement in child classes");
}

- (NSString*)fieldValue
{
    NSAssert(YES, @"Implement in child classes");
    return @"";
}

- (BOOL)validate:(NSError **)error
{
    return YES;
}

//Touches
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (responderDelegate != nil) {
        [responderDelegate hideKeyBoard];
    }
}

- (BOOL)becomeFirstResponder
{
    return NO;
}

- (BOOL)resignFirstResponder
{
    return NO;
}

- (BOOL)canBecomeFirstResponder
{
    return NO;
}

- (BOOL)canResignFirstResponder
{
    return NO;
}

- (BOOL)isFirstResponder
{
    return NO;
}

@end
