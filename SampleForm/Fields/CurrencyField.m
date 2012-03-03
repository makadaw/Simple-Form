//
//  CurrencyField.m
//  SampleForm
//
//  Created by mc816 on 03.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "CurrencyField.h"

@implementation CurrencyField
@synthesize currencySymbol;

- (void)viewDidAddedToForm
{
    self.inputField.borderStyle = UITextBorderStyleRoundedRect;
    self.inputField.frame = CGRectMake(10, 44, self.bounds.size.width-20, 30.0);
    self.inputField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    if (self.currencySymbol != nil) {
        UILabel *currencyLabel = [[UILabel alloc] init];
        CGSize cs = [self.currencySymbol sizeWithFont:currencyLabel.font constrainedToSize:CGSizeMake(100, 20) lineBreakMode:currencyLabel.lineBreakMode];
        currencyLabel.text = self.currencySymbol;
        currencyLabel.frame = CGRectMake(0, 0, cs.width, cs.height);
        
        
        self.inputField.leftView  = currencyLabel;
        self.inputField.leftViewMode = UITextFieldViewModeAlways;
        [currencyLabel release];
    }
    
    self.titleLabel.frame = CGRectMake(10, 10, self.bounds.size.width-20, 25);
    self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    self.decimalPartSize = 2;
}

- (void)dealloc
{
    [self.currencySymbol release];
    [super dealloc];
}

@end
