//
//  ITField.h
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITFieldResponderDelegate.h"
#import "ITFieldDelegate.h"

@interface ITField : UIView

@property (nonatomic, retain) NSString *fieldName;
@property (assign) id<ITFieldResponderDelegate> responderDelegate;
@property (assign) id<ITFieldDelegate> delegate;
@property (nonatomic, getter = isEditable) BOOL editable;

- (id)initWithFieldName:(NSString*)theFieldName;

- (CGFloat)fieldHeight;
- (void)postInit;
- (void)viewDidAddedToForm;

- (void)setFieldValue:(NSString *)newValue;
- (NSString *)fieldValue;

- (BOOL)validate:(NSError **)error;

@end
