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
    self.spinnerButton.frame = CGRectMake(50, 44, self.bounds.size.width-60, 30.0);
    self.spinnerButton.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.spinnerButton.backgroundColor = [UIColor greenColor];
    
    self.titleLabel.frame = CGRectMake(10, 10, self.bounds.size.width-20, 25);
    self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

- (void)showErrorView
{
    [super showErrorView];
    UIView *errorView = [self viewWithTag:ITFIELD_ERROR_VIEW];
    errorView.center = CGPointMake(25, 59);
}

@end
