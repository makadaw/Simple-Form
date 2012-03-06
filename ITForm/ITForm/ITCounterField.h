//
//  ITCounterField.h
//  ITForm
//
//  Created by mc816 on 06.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITNumericField.h"

@interface ITCounterField : ITNumericField

@property (readonly, assign) UIButton *incrementButton;
@property (readonly, assign) UIButton *decrementButton;

@property NSInteger maxValue;
@property NSInteger minValue;

- (void)incrementValue;
- (void)decrementValue;

@end
