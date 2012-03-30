//
//  ITLabelField.m
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITImageField.h"

@interface ITImageField()
@property (readwrite, assign) UIImageView *imageView;
@property (readwrite, assign) UIButton *imageButton;
@end

@implementation ITImageField
@synthesize imageView;
@synthesize imageButton;

- (void)postInit
{
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.frame = CGRectMake(0, 0, 100, 100);
    self.imageView.backgroundColor = [UIColor clearColor];
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.imageView.clipsToBounds = YES;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    self.imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.imageButton.frame = CGRectMake(10, 5, 100, 100);
    self.imageButton.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.imageButton addSubview:self.imageView];
    [self.imageView release];
    [self addSubview:self.imageButton];
    [self.imageButton release];
}

- (CGFloat)fieldHeight
{
    return 110.0;
}

- (void)setFieldValue:(UIImage*)newValue
{
    self.imageView.image = newValue;
}

- (UIImage*)fieldValue
{
    return self.imageView.image;
}

@end
