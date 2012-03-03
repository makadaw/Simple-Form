//
//  ITLabelField.m
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITLabelField.h"

@interface ITLabelField()
@property (readwrite, assign) UILabel *titleLabel;
@end

@implementation ITLabelField
@synthesize titleLabel;

- (void)postInit
{
    self.editable = NO;
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.titleLabel];
    [self.titleLabel release];
}

- (void)viewDidAddedToForm
{
    self.titleLabel.frame = CGRectMake(10, 10, self.bounds.size.width-20, 25);
    self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
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
@end
