//
//  DateTimeField.m
//  SampleForm
//
//  Created by mc816 on 02.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "DateTimeField.h"

@implementation DateTimeField

- (void)viewDidAddedToForm
{
    self.titleLabel.frame = CGRectMake(10, 10, self.bounds.size.width-20, 25);
    self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    self.pickerButton.frame = CGRectMake(self.bounds.size.width-50, 40, 30, 30.0);
    self.pickerButton.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.pickerButton.backgroundColor = [UIColor greenColor];
    
    self.valueLabel.frame = CGRectMake(10, 40, self.bounds.size.width-70, 30);
}

@end
