//
//  ITSwitchField.h
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITField.h"

@interface ITSwitchField : ITField

@property (readonly, retain) UISwitch *fieldSwitch;
@property (readonly, retain) UILabel *titleLabel;

- (void)setFieldBoolValue:(BOOL)newValue;

@end
