//
//  ITTextViewField.m
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITTextViewField.h"

@interface ITTextViewField()
@property (readwrite, assign) UITextView *inputField;
@property (readwrite, assign) UILabel *titleLabel;
@end

@implementation ITTextViewField
@synthesize inputField=_inputField;
@synthesize titleLabel;

- (void)postInit
{
    self.inputField = [[UITextView alloc] init];;
    self.inputField.delegate = self;
    [self addSubview:self.inputField];
    [self.inputField release];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.titleLabel];
}

- (CGFloat)fieldHeight
{
    return 120.0;
}

- (void)setFieldValue:(NSString *)newValue
{
    self.inputField.text = newValue;
}

- (NSString*)fieldValue
{
    return self.inputField.text;
}

- (BOOL)becomeFirstResponder
{
    return [self.inputField becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
    return [self.inputField resignFirstResponder];
}

- (BOOL)isFirstResponder
{
    return [self.inputField isFirstResponder];
}


- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)canResignFirstResponder
{
    return YES;
}

//TextView delegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if (self.responderDelegate) {
        [self.responderDelegate startEditingField:self];
    }
    return YES;
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if (self.responderDelegate) {
        [self.responderDelegate startEditingField:self];
    }
}
@end
