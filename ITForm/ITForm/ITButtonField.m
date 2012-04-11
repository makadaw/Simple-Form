//
//  ITButtonField.m
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITButtonField.h"

@interface ITButtonField()
@property (readwrite, assign) UILabel *button;
@end

@implementation ITButtonField
@synthesize button;

- (void)postInit
{
    self.editable = NO;
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.backgroundColor = [UIColor grayColor];
    [self addSubview:self.button];
    [self.button release];
}

- (void)viewDidAddedToForm
{
    self.button.frame = CGRectMake(10, 10, self.bounds.size.width-20, 25);
    self.button.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}

- (CGFloat)fieldHeight
{
    return 44.0;
}

- (void)setFieldValue:(NSString *)newValue
{
}

- (NSString*)fieldValue
{
    return @"";
}

//- (void)reset
//{
//}

@end
