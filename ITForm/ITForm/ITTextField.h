//
//  ITTextField.h
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITField.h"

@protocol ITTextFieldDelegate <ITFieldDelegate>

@end

@interface ITTextField : ITField <UITextFieldDelegate>

@property (readonly, assign) UITextField *inputField;
@property (readonly, assign) UILabel *titleLabel;

@end
