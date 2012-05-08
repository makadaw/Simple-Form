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

#define ITFIELD_ERROR_VIEW 255

@class ITBaseValidator;

@interface ITField : UIView

@property (nonatomic, retain) NSString *fieldName;
@property (assign) id<ITFieldResponderDelegate> responderDelegate;
@property (assign) id<ITFieldDelegate> delegate;
@property (nonatomic) BOOL editable;

@property (readonly, assign) NSMutableArray *validatorsList;

- (id)initWithFieldName:(NSString*)theFieldName;

- (CGFloat)fieldHeight;
- (void)postInit;
- (void)viewDidAddedToForm;

- (void)setFieldValue:(NSString *)newValue;
- (NSString *)fieldValue;

- (void)reset;
- (BOOL)validate:(NSError **)error;
- (UIView*)errorView;
- (void)showErrorView;
- (void)hideErrorView;
- (void)addValidator:(ITBaseValidator*)validator;
- (void)removeValidator:(ITBaseValidator*)validator;

@end
