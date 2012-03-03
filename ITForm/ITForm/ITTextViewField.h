//
//  ITTextViewField.h
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITField.h"

@interface ITTextViewField : ITField <UITextViewDelegate>

@property (readonly, assign) UITextView *inputField;
@property (readonly, assign) UILabel *titleLabel;

@end
