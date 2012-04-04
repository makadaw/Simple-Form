//
//  ITFieldSet.m
//  ITForm
//
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITFieldSet.h"

@implementation ITFieldSet

@synthesize fields, formManager = _formManager, name;



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        fields = [[NSMutableArray alloc] init];
        self.clipsToBounds = YES;
    }
    return self;
}

/*
- (id)initWithFormManager:(ITFormManager*)theFormManager
{
    UIView *contentManager = (UIView*)theFormManager.contentManager;
    self = [super initWithFrame:CGRectMake(0, 0, contentManager.frame.size.width, 0)];
    if (self) {
        // Initialization code
        self.formManager = theFormManager;
        fields = [[NSMutableArray alloc] init];
        self.clipsToBounds = YES;
    }
    return self;
}
*/

- (void)dealloc
{
    [fields release];
    [name release];
}

- (void)addField:(ITField*)field
{
    [fields addObject:field];
    //field.responderDelegate = self.formManager;
    
    float height = self.frame.size.height;
    field.frame = CGRectMake(0, height, self.frame.size.width, [field fieldHeight]);
    [self addSubview:field];
    
    height += [field fieldHeight];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
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
    for (ITField *field in self.fields) {
        field.responderDelegate = self.formManager;
        [field viewDidAddedToForm];
    }
}

- (void)hideAnimated:(BOOL)animated
{
    float duration = (animated) ? 0.2 : 0.0;
    [UIView animateWithDuration:duration
        animations:^{
            float fieldSetHeight = self.frame.size.height;
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 0);
            
            UIScrollView *contentManager = (UIScrollView*)self.formManager.contentManager;
            contentManager.contentSize = CGSizeMake(contentManager.contentSize.width, contentManager.contentSize.height-fieldSetHeight);
            
            int startIndex = [self.formManager.items indexOfObject:self];
            for (int i = startIndex+1; i < [self.formManager.items count]; i++) {
                UIView *item = [self.formManager.items objectAtIndex:i];
                item.frame = CGRectMake(item.frame.origin.x, item.frame.origin.y-fieldSetHeight, item.frame.size.width, item.frame.size.height);
            }
        }
        completion: ^ (BOOL finished) {
            self.hidden = YES;
        }
     ];
}

- (void)showAnimated:(BOOL)animated
{
    float duration = (animated) ? 0.2 : 0.0;
    self.hidden = NO;
    [UIView animateWithDuration:duration
        animations:^{
            UIView *lastField = [self.fields lastObject];
            float fieldSetHeight = lastField.frame.origin.y+lastField.frame.size.height;
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, fieldSetHeight);

            UIScrollView *contentManager = (UIScrollView*)self.formManager.contentManager;
            contentManager.contentSize = CGSizeMake(contentManager.contentSize.width, contentManager.contentSize.height+fieldSetHeight);

            int startIndex = [self.formManager.items indexOfObject:self];
            for (int i = startIndex+1; i < [self.formManager.items count]; i++) {
                UIView *item = [self.formManager.items objectAtIndex:i];
                item.frame = CGRectMake(item.frame.origin.x, item.frame.origin.y+fieldSetHeight, item.frame.size.width, item.frame.size.height);
            }
        }
     ];
}

- (void)setFormManager:(ITFormManager*)formManager
{
    _formManager = formManager;
    
    UIView *contentManager = (UIView*)formManager.contentManager;
    CGRect sf = self.frame;
    sf.size.width = contentManager.frame.size.width;
    self.frame = sf;
    
    for (ITField *field in self.fields) {
        CGRect ff = field.frame;
        ff.size.width = contentManager.frame.size.width;
        field.frame = ff;
        field.responderDelegate = formManager;
    }
}

- (ITFormManager*)formManager
{
    return _formManager;
}

@end
