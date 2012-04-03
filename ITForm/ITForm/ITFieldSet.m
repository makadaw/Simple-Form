//
//  ITFieldSet.m
//  ITForm
//
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITFieldSet.h"

@implementation ITFieldSet

@synthesize fields, formManager;

- (id)initWithFormManager:(ITFormManager*)theFormManager
{
    UIView *contentManager = (UIView*)theFormManager.contentManager;
    self = [super initWithFrame:CGRectMake(0, 0, contentManager.frame.size.width, 0)];
    if (self) {
        // Initialization code
        self.formManager = theFormManager;
        fields = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [fields release];
}

- (void)addField:(ITField*)field
{
    [fields addObject:field];
    field.responderDelegate = self.formManager;
    
    float height = self.frame.size.height;
    field.frame = CGRectMake(0, height, self.frame.size.width, [field fieldHeight]);
    [self addSubview:field];
    
    height += [field fieldHeight];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
    [field viewDidAddedToForm];
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

- (void)viewDidAddedToForm
{
    
}

@end
