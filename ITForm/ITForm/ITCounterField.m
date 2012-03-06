//
//  ITCounterField.m
//  ITForm
//
//  Created by mc816 on 06.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITCounterField.h"

@interface ITCounterField()
@property (readwrite, assign) UIButton *incrementButton;
@property (readwrite, assign) UIButton *decrementButton;

@end

@implementation ITCounterField
@synthesize incrementButton, decrementButton;
@synthesize maxValue, minValue;

- (void)postInit
{
    [super postInit];
    
    self.incrementButton = [[UIButton alloc] init];
    [self.incrementButton setTitle:@"+" forState:UIControlStateNormal];
    [self addSubview:self.incrementButton];
    [self.incrementButton addTarget:self action:@selector(incrementValue) forControlEvents:UIControlEventTouchUpInside];
    [self.incrementButton release];
    
    self.decrementButton = [[UIButton alloc] init];
    [self.decrementButton setTitle:@"-" forState:UIControlStateNormal];
    [self addSubview:self.decrementButton];
    [self.decrementButton addTarget:self action:@selector(decrementValue) forControlEvents:UIControlEventTouchUpInside];
    [self.decrementButton release];
    self.inputField.text = @"0";
    
}

- (void)incrementValue
{
    NSInteger intV = [self.inputField.text integerValue];
    intV++;
    if (self.maxValue && self.maxValue < intV) {
        return;
    }
    self.inputField.text = [NSString stringWithFormat:@"%d", intV];
}

- (void)decrementValue
{
    NSInteger intV = [self.inputField.text integerValue];
    intV--;
    if (intV < self.minValue) {
        return;
    }
    self.inputField.text = [NSString stringWithFormat:@"%d", intV];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    BOOL result = [super textField:textField shouldChangeCharactersInRange:range replacementString:string];
    NSString *newSring = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSInteger intV = [newSring integerValue];
    if (intV < self.minValue) {
        result = NO;
    }
    
    if (self.maxValue && self.maxValue < intV) {
        result = NO;
    }
    return result;
}



@end
