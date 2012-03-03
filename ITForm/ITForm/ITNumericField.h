//
//  ITNumericField.h
//  ITForm
//
//  Created by mc816 on 02.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITTextField.h"

@interface ITNumericField : ITTextField

@property (retain) NSString *decimalSeparator;
@property (nonatomic) NSInteger decimalPartSize;

@end
