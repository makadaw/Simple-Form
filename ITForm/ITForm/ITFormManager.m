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


- (ITField*)fieldByName:(NSString*)fieldName
{
    NSUInteger index = [self.fields indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop){
        ITField *f = (ITField*)obj;
        if ([f.fieldName isEqualToString:fieldName]) {
            *stop = YES;
        }
        return *stop;
    }];
    ITField *field;
    if (index != NSNotFound) {
        field = [self.fields objectAtIndex:index];
    }
    return field;
}

//Validation and data part
- (BOOL)validateForm:(NSError **)error
{
    BOOL isValid = YES;
    NSString *errorStr = @"";
    for (ITField *field in self.fields) {
        NSError *err = nil;
        if (![field validate:&err]) {
            isValid = NO;
            errorStr = [errorStr stringByAppendingString:err.localizedDescription];
        }
    }
    if (!isValid) {
        *error = [NSError errorWithDomain:@"ITForm" code:1 userInfo:[NSDictionary dictionaryWithObject:errorStr forKey:NSLocalizedDescriptionKey]];
    }
    return isValid;
}

//Get form values
- (NSDictionary*)formValues
{
    NSMutableDictionary *tmpData = [[NSMutableDictionary alloc] init];
    for (ITField *field in self.fields) {
        if (field.isEditable && !field.isHidden) {
            NSString *v = [field fieldValue];
            if (v == nil) {
                [tmpData setObject:@"" forKey:field.fieldName];
            } else {
                [tmpData setObject:v forKey:field.fieldName];
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
