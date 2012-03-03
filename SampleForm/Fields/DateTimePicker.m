//
//  DateTimePicker.m
//  SampleForm
//
//  Created by mc816 on 02.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "DateTimePicker.h"
#import "ActionSheetDatePicker.h"

@implementation DateTimePicker

- (void)datetimeField:(ITDateTimeField*)field showSelectDialogWithDate:(NSDate*)date
{
    UIDatePickerMode dateMode;
    switch (field.fieldMode) {
        case ITDateTime:
            dateMode = UIDatePickerModeDateAndTime;
            break;
        case ITDate:
            dateMode = UIDatePickerModeDate;
            break;
        case ITTime:
            dateMode = UIDatePickerModeTime;
            break;
    }
    
    NSDate *pickerDate;
    if (field.fieldDate == nil) {
        pickerDate = [NSDate date];
    } else {
        pickerDate = field.fieldDate;
    }
    
    ActionSheetDatePicker *actionSheetDatePicker = [[ActionSheetDatePicker alloc] initWithTitle:@"" datePickerMode:dateMode selectedDate:pickerDate target:self action:@selector(dateWasSelected:element:) origin:field.pickerButton];
    dateTimeField = field;
    if (field.fieldMode != ITTime) {
        [actionSheetDatePicker addCustomButtonWithTitle:@"Today" value:[NSDate date]];
    }
    [actionSheetDatePicker showActionSheetPicker];
    UIDatePicker *internalDatePicker = (UIDatePicker*)actionSheetDatePicker.pickerView;
    if (field.maximumDate != nil) {
        internalDatePicker.maximumDate = field.maximumDate;
    }
    if (field.minimumDate != nil) {
        internalDatePicker.minimumDate = field.minimumDate;
    }

}

- (void)dateWasSelected:(NSDate *)newSelectedDate element:(id)element
{
    dateTimeField.fieldDate = newSelectedDate;
}

@end
