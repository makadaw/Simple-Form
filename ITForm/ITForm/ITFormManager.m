//
//  ITFormManager.m
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITFormManager.h"
#import "ITField.h"

@interface ITFormManager()

@property (readwrite, retain) NSArray *fields;

@end

@implementation ITFormManager
@synthesize fields;
@synthesize contentManager;

- (id)init
{
    self = [super init];
    if (self) {
        fields = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)initWithContentManager:(id<ITFormContainerView>)ctManager
{
    self = [self init];
    if (self) {
        contentManager = [ctManager retain];
        [contentManager setFormManager:self];
    }
    return self;
}

- (void)dealloc
{
    [fields release];
    [contentManager release];
    [super dealloc];
}


- (void)addField:(ITField*)field
{
    [fields addObject:field];
    field.responderDelegate = self;
    [contentManager addField:field];
}

//Validation and data part
- (BOOL)validateForm
{
    return YES;
}

//Get form values
- (NSDictionary*)formValues
{
    NSMutableDictionary *tmpData = [[NSMutableDictionary alloc] init];
    for (ITField *field in self.fields) {
        if (field.isEditable && !field.isHidden) {
            NSString *v = [field fieldValue];
            if (v == nil) {
                [tmpData setObject:[NSNull null] forKey:field.fieldName];
            } else {
                [tmpData setObject:[field fieldValue] forKey:field.fieldName];
            }
        }
    }
    NSDictionary *result = [NSDictionary dictionaryWithDictionary:tmpData];
    [tmpData release];
    return result;
}

- (void)setFormValues:(NSDictionary*)data
{
    for (ITField *field in self.fields) {
        NSString *value = [data objectForKey:field.fieldName];
        if (value != nil) {
            [field setFieldValue:value];
        }
    }
}

//Responder part
- (ITField*)respondedField
{
    return editingField;
}

- (void)startEditingField:(ITField*)field
{
    editingField = field;
}

- (void)endEditingField:(ITField*)field
{
    editingField = nil;
    NSInteger index = [fields indexOfObject:field];
    NSInteger count = [fields count];
    BOOL switched = NO;
    for (int i = index+1; i < count; i++) {
        ITField *f = [fields objectAtIndex:i];
        if ([f canBecomeFirstResponder]) {
            [f becomeFirstResponder];
            switched = YES;
            break;
        }
    }
    if (!switched) {
        [contentManager restoreNoKeyboardPosition];
    }
}

- (void)hideKeyBoard
{
    [editingField resignFirstResponder];
    editingField = nil;
    [contentManager restoreNoKeyboardPosition];
}



@end
