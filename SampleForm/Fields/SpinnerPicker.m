//
//  SpinnerPicker.m
//  ITFormTest
//
//  Created by mc816 on 29.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "SpinnerPicker.h"
#import "ActionSheetStringPicker.h"

@implementation SpinnerPicker

- (void)spinnerField:(ITSpinnerField*)field showSelectDialogWithItems:(NSArray*)items
{
    int selectedIndex = 0;
    NSMutableArray *itemsArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [field.items count]; i++) {
        id item = [field.items objectAtIndex:i];
        NSString *title = [item valueForKey:field.displayKey];
        if (title) {
            [itemsArray addObject:title];
            if (field.selectedItem == item) {
                selectedIndex = i;
            }
        }
    }
    
    [ActionSheetStringPicker showPickerWithTitle:@"- Select One -" rows:itemsArray initialSelection:selectedIndex doneBlock:^(ActionSheetStringPicker *picker, NSInteger newSelecetedIndex, id selectedValue){
        field.selectedItem = [items objectAtIndex:newSelecetedIndex];
    } cancelBlock:^(ActionSheetStringPicker *picker){
    } origin:field.spinnerButton];
    [itemsArray release];
}

@end
