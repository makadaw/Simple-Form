//
//  ITLabelField.h
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITField.h"

@interface ITImageField : ITField

@property (readonly, assign) UIImageView *imageView;
@property (readonly, assign) UIButton *imageButton;

- (void)setFieldValue:(UIImage*)newValue;
- (UIImage*)fieldValue;

@end
