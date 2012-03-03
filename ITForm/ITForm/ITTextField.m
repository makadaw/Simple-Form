//
//  ITTextField.m
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITTextField.h"

@interface ITTextField()
@property (readwrite, assign) UITextField *inputField;
@property (readwrite, assign) UILabel *titleLabel;
@end

@implementation ITTextField
@synthesize inputField=_inputField;
@synthesize titleLabel=_titleLabel;

- (void)postInit
{
    self.inputField = [[UITextField alloc] init];
    self.inputField.delegate = self;
    [self addSubview:self.inputField];
    [self.inputField release];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.titleLabel];
    [self.titleLabel release];
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

//TextFieldDelegate methods
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (self.responderDelegate) {
        [self.responderDelegate startEditingField:self];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.delegate) {
        [self.delegate fieldDidChangeValue:self];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (self.responderDelegate) {
        [self.responderDelegate endEditingField:self];
    }
    return NO;
}

- (void)showErrorView
{
    UIView *errorView = [self errorView];
    errorView.frame = CGRectMake(0, 0, 20, 20);
    self.inputField.rightView = errorView;
    self.inputField.rightViewMode = UITextFieldViewModeAlways;
}

- (void)hideErrorView
{
    self.inputField.rightView = nil;
}



@end
