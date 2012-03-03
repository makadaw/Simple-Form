//
//  ITSwitchField.m
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITSwitchField.h"

@interface ITSwitchField()
@property (readwrite, retain) UISwitch *fieldSwitch;
@property (readwrite, retain) UILabel *titleLabel;
- (void)switchChangeValue:(id)sender;
@end

@implementation ITSwitchField
@synthesize fieldSwitch, titleLabel;

- (void)postInit
{
    UISwitch *sw = [[UISwitch alloc] init];
    self.fieldSwitch = sw;
    [self addSubview:self.fieldSwitch];
    [sw release];
    
    [self.fieldSwitch addTarget:self action:@selector(switchChangeValue:) forControlEvents:UIControlEventValueChanged];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.titleLabel];
}

- (CGFloat)fieldHeight
{
    return 44.0;
}

- (void)setFieldBoolValue:(BOOL)newValue
{
    self.fieldSwitch.on = newValue;
}

- (void)setFieldValue:(NSString *)newValue
{
    if ([newValue isEqualToString:@"1"] || [newValue isEqualToString:@"true"]) {
        self.fieldSwitch.on = YES;
    } else {
        self.fieldSwitch.on = NO;
    }
}

- (NSString*)fieldValue
{
    return self.fieldSwitch.on ? @"1" : @"0";
}

- (void)switchChangeValue:(id)sender
{
    if (self.delegate) {
        [self.delegate fieldDidChangeValue:self];
    }
}

@end
