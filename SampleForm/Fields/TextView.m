//
//  TextView.m
//  ITFormTest
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "TextView.h"

@implementation TextView

- (void)viewDidAddedToForm
{
    self.inputField.frame = CGRectMake(10, 44, self.bounds.size.width-20, 70.0);
    self.inputField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    self.titleLabel.frame = CGRectMake(10, 10, self.bounds.size.width-20, 25);
    self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

- (void)showErrorView
{
    [super showErrorView];
    UIView *errorView = [self viewWithTag:ITFIELD_ERROR_VIEW];
    errorView.center = CGPointMake(self.bounds.size.width-30, 19);
    errorView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
}

@end
