//
//  ITNumericField.m
//  ITForm
//
//  Created by mc816 on 02.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITNumericField.h"

@implementation ITNumericField
@synthesize decimalSeparator, decimalPartSize;

- (void)postInit
{
    [super postInit];
    self.inputField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.decimalSeparator = @".";
    self.decimalPartSize = 0;
}

- (void)dealloc
{
    [decimalSeparator release];
    [super dealloc];
}

- (void)setDecimalPartSize:(NSInteger)theDecimalPartSize
{
    if (theDecimalPartSize < 0) {
        theDecimalPartSize = 0;
    }
    if (theDecimalPartSize > 100) {
        theDecimalPartSize = 100;
    }
    decimalPartSize = theDecimalPartSize;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    BOOL result = YES;
    NSString *newSring = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSString *regex;
    if (self.decimalPartSize > 0) {
        //Decimal validate
        regex = [NSString stringWithFormat:@"[\\d]+\\%@?[0-9]{0,%d}", self.decimalSeparator, self.decimalPartSize];
    } else {
        regex = @"[\\d]";
    }
    NSPredicate *testPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([testPredicate evaluateWithObject:newSring] || [string isEqualToString:@""]) {
        result = YES;
    } else {
        result = NO;
    }
    return result;
}

@end
