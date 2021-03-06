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
@property (readwrite, retain) NSArray *fieldSets;
@property (readwrite, retain) NSArray *items;

@end

@implementation ITFormManager
@synthesize fields;
@synthesize fieldSets;
@synthesize items;
@synthesize contentManager;

- (id)init
{
    self = [super init];
    if (self) {
        fields = [[NSMutableArray alloc] init];
        fieldSets = [[NSMutableArray alloc] init];
        items = [[NSMutableArray alloc] init];
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
    [fieldSets release];
    [items release];
    [contentManager release];
    [super dealloc];
}


- (void)addField:(ITField*)field
{
    [fields addObject:field];
    [items addObject:field];
    field.responderDelegate = self;
    [contentManager addField:field];
}


- (void)addFieldSet:(ITFieldSet*)fieldSet
{
    [fieldSets addObject:fieldSet];
    [items addObject:fieldSet];
    fieldSet.formManager = self;
    
    for (ITField *field in fieldSet.fields) {
        [fields addObject:field];
    }
    [contentManager addFieldSet:fieldSet];
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

- (ITFieldSet*)fieldSetByName:(NSString*)fieldSetName
{
    NSUInteger index = [self.fieldSets indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop){
        ITFieldSet *f = (ITFieldSet*)obj;
        if ([f.name isEqualToString:fieldSetName]) {
            *stop = YES;
        }
        return *stop;
    }];
    ITFieldSet *fieldSet = nil;
    if (index != NSNotFound) {
        fieldSet = [self.fieldSets objectAtIndex:index];
    }
    return fieldSet;
}

#pragma mark - Reseting

- (void)reset
{
    for (ITField *field in self.fields) {
        [field reset];
    }
    UIScrollView *cm = (UIScrollView*)self.contentManager;
    [cm setContentOffset:CGPointMake(0, 0) animated:NO];
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
        if (field.editable && !field.isHidden) {
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
    
    //CGRect fieldRealFrame = [(UIScrollView*)contentManager convertRect:field.frame fromView:field.superview];
    //[(UIScrollView*)contentManager scrollRectToVisible:fieldRealFrame animated:YES];
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
    //if (!switched) {
    //    [contentManager restoreNoKeyboardPosition];
    //}
}

- (void)hideKeyBoard
{
    [editingField resignFirstResponder];
    editingField = nil;
    //[contentManager restoreNoKeyboardPosition];
}



@end
