//
//  SpinnerField.m
//  ITFormTest
//
//  Created by mc816 on 29.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "SpinnerField.h"

@implementation SpinnerField

- (void)viewDidAddedToForm
{
    self.spinnerButton.frame = CGRectMake(10, 44, self.bounds.size.width-20, 30.0);
    self.spinnerButton.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.spinnerButton.backgroundColor = [UIColor greenColor];
    
    self.titleLabel.frame = CGRectMake(10, 10, self.bounds.size.width-20, 25);
    self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

@end
