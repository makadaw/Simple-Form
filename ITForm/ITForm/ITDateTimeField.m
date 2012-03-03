//
//  ITDateTimeField.m
//  ITForm
//
//  Created by mc816 on 02.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITDateTimeField.h"

@interface ITDateTimeField()
@property (readwrite, assign) UIButton *pickerButton;
@property (readwrite, assign) UILabel *titleLabel;
@property (readwrite, assign) UILabel *valueLabel;
- (void)pickerButtonAction:(id)sender;
- (void)displayFieldDate;
@end

@implementation ITDateTimeField
@synthesize pickerButton, titleLabel, valueLabel;
@synthesize dataSelect, fieldMode;
@synthesize dateFormat, dateTimeFormat, timeFormat, returnFormat;
@synthesize fieldDate;
@synthesize minimumDate, maximumDate;

- (void)dealloc
{
    [self.fieldDate release];
    [self.minimumDate release];
    [self.maximumDate release];
    [self.returnFormat release];
    [self.dateFormat release];
    [self.dateTimeFormat release];
    [self.timeFormat release];
    [self.dataSelect release];
    [super dealloc];
}

- (void)postInit
{
    self.fieldMode = ITDateTime;
    self.returnFormat = @"yyyy-MM-dd HH:mm:ss";
    self.dateTimeFormat = @"yyyy-MM-dd HH:mm:ss"; //"12/14/1901 4:31:43 PM"
    self.dateFormat = @"yyyy-MM-dd";
    self.timeFormat = @"HH:mm:ss";
    
    self.pickerButton = [[UIButton alloc] init];
    [self.pickerButton addTarget:self action:@selector(pickerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.pickerButton];
    [self.pickerButton setTitle:@"Pick" forState:UIControlStateNormal];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.titleLabel];
    [self.titleLabel release];
    
    self.valueLabel = [[UILabel alloc] init];
    self.valueLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.valueLabel];
    [self.valueLabel release];
}

- (void)setFieldDate:(NSDate *)newFieldDate
{
    [fieldDate release];
    fieldDate = nil;
    if (newFieldDate != nil) {
        fieldDate = [newFieldDate retain];
    }
    if (self.delegate != nil) {
        [self.delegate fieldDidChangeValue:self];
    }
    [self displayFieldDate];
}

- (void)setFieldValue:(NSString *)newValue
{
    //Here we will try to parse date
    //First try to parse with value format
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:self.returnFormat];
    NSDate *parseDate = [df dateFromString:newValue];
    //
    [df release];
    self.fieldDate = parseDate;
}

- (NSString*)fieldValue
{
    NSString *result = nil;
    if (self.fieldDate != nil) {
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:self.returnFormat];
        result = [df stringFromDate:self.fieldDate];
        [df release];
    }
    return result;
}

- (void)pickerButtonAction:(id)sender
{
    if (self.dataSelect != nil) {
        [self.dataSelect datetimeField:self showSelectDialogWithDate:self.fieldDate];
    }
}

- (void)displayFieldDate
{
    NSString *format;
    switch (self.fieldMode) {
        case ITDate:
            format = self.dateFormat;
            break;
            
        case ITTime:
            format = self.timeFormat;
            break;
            
        case ITDateTime:
        default:
            format = self.dateTimeFormat;
            break;
    }
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:format];
    self.valueLabel.text = [df stringFromDate:self.fieldDate];
    [df release];
}

@end
