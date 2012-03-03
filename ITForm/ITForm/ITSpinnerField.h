//
//  ITSpinnerField.h
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITField.h"

@class ITSpinnerField;

@protocol ITSpinnerFieldDataSelect <NSObject>
@required
- (void)spinnerField:(ITSpinnerField*)field showSelectDialogWithItems:(NSArray*)items;
//- (id)spinnerField:(ITSpinnerField*)field getSelectedItemFromString:(NSString*)value;

@end

@interface ITSpinnerField : ITField

@property (nonatomic, retain) NSArray *items;
@property (readonly, assign) UIButton *spinnerButton;
@property (readonly, assign) UILabel *titleLabel;
@property (retain) id<ITSpinnerFieldDataSelect> dataSelect;
@property (nonatomic, assign) id selectedItem;
@property (retain) NSString *valueKey;
@property (retain) NSString *displayKey;

- (void)spinnerButtonAction:(id)sender;

@end
