//
//  ITFormManager.h
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITFormContainerView.h"
#import "ITFieldResponderDelegate.h"
#import "ITFieldSet.h"

@class ITFormManager, ITField;

@interface ITFormManager : NSObject <ITFieldResponderDelegate> {
    ITField *editingField;
}

@property (readonly, retain) NSMutableArray *fields;
@property (readonly, retain) NSMutableArray *fieldSets;
@property (readonly, retain) NSMutableArray *items;
@property (readonly, retain) id<ITFormContainerView> contentManager;

- (id)initWithContentManager:(id<ITFormContainerView>)ctManager;
- (void)addField:(ITField*)field;
- (void)addFieldSet:(ITFieldSet*)fieldSet;

- (ITField*)fieldByName:(NSString*)fieldName;
- (ITFieldSet*)fieldSetByName:(NSString*)fieldSetName;

- (ITField*)respondedField;

- (void)reset;
- (BOOL)validateForm:(NSError **)error;
- (NSDictionary*)formValues;
- (void)setFormValues:(NSDictionary*)data;

@end
