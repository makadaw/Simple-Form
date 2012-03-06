//
//  CounterField.m
//  SampleForm
//
//  Created by mc816 on 06.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "CounterField.h"

@implementation CounterField

- (void)viewDidAddedToForm
{
    self.inputField.borderStyle = UITextBorderStyleRoundedRect;
    self.inputField.frame = CGRectMake(40, 44, self.bounds.size.width-80, 30.0);
    self.inputField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    self.titleLabel.frame = CGRectMake(10, 10, self.bounds.size.width-20, 25);
    self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    self.incrementButton.frame = CGRectMake(self.bounds.size.width-35, 44, 30, 30);
    self.incrementButton.backgroundColor = [UIColor redColor];
    self.decrementButton.frame = CGRectMake(5, 44, 30, 30);
    self.decrementButton.backgroundColor = [UIColor redColor];
    
    self.maxValue = 10;
    //self.minValue = 0;
}

@end
