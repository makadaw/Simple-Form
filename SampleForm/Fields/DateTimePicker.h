//
//  DateTimePicker.h
//  SampleForm
//
//  Created by mc816 on 02.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITDateTimeField.h"

@interface DateTimePicker : NSObject <ITDateTimeFieldDataSelect> {
    ITDateTimeField *dateTimeField;
}

@end
