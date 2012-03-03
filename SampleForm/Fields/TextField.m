//
//  TextField.m
//  ITFormTest
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "TextField.h"

@implementation TextField

- (void)viewDidAddedToForm
{
    self.inputField.borderStyle = UITextBorderStyleRoundedRect;
    self.inputField.frame = CGRectMake(10, 44, self.bounds.size.width-20, 30.0);
    self.inputField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    self.titleLabel.frame = CGRectMake(10, 10, self.bounds.size.width-20, 25);
    self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

@end
