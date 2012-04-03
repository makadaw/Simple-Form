//
//  ITFieldSet.h
//  ITForm
//
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITField.h"
#import "ITFormManager.h"

@interface ITFieldSet : UIView

@property (readonly, retain) NSMutableArray *fields;
@property (assign) ITFormManager *formManager;

- (id)initWithFormManager:(ITFormManager*)formManager;
- (void)addField:(ITField*)field;

- (void)viewDidAddedToForm;

@end
