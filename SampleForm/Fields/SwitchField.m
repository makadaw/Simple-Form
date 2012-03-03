//
//  SwitchField.m
//  ITFormTest
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "SwitchField.h"

@implementation SwitchField

- (void)viewDidAddedToForm
{
    //self.fieldSwitch.frame = CGRectMake(10, 10, 60, 20)
    self.fieldSwitch.center = CGPointMake(45, 22);
    
    self.titleLabel.frame = CGRectMake(90, 9.5, self.bounds.size.width-100, 25);
    self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

@end
