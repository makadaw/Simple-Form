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
    self.fieldSwitch.center = CGPointMake(55, 22);
    
    self.titleLabel.frame = CGRectMake(120, 9.5, self.bounds.size.width-120, 25);
    self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

@end
