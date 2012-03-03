//
//  ITDateTimeField.h
//  ITForm
//
//  Created by mc816 on 02.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITField.h"

typedef enum {
    ITDateTime,
    ITDate,
    ITTime
} ITDateTimeFieldMode;

@class ITDateTimeField;

@protocol ITDateTimeFieldDataSelect <NSObject>
@required
- (void)datetimeField:(ITDateTimeField*)field showSelectDialogWithDate:(NSDate*)date;

@end

@interface ITDateTimeField : ITField

@property (readonly, assign) UIButton *pickerButton;
@property (readonly, assign) UILabel *titleLabel;
@property (readonly, assign) UILabel *valueLabel;
@property (retain) id<ITDateTimeFieldDataSelect> dataSelect;

@property (nonatomic) ITDateTimeFieldMode fieldMode;
@property (nonatomic, retain) NSDate *fieldDate;
@property (retain) NSString *dateTimeFormat; // 1/18/2012 2:24:59 PM
@property (retain) NSString *dateFormat; // 1/19/2012
@property (retain) NSString *timeFormat; // 2:00:00 AM

@property (nonatomic, retain) NSDate *minimumDate;
@property (nonatomic, retain) NSDate *maximumDate;


- (void)setFieldValue:(NSString *)newValue withFormat:(NSString*)format;
- (NSString*)currentFormat;

@end
