//
//  ITField.m
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITField.h"
#import "ITBaseValidator.h"

@interface ITField()
@property (readwrite, assign) NSMutableArray *validatorsList;
@end

@implementation ITField
@synthesize fieldName, editable;
@synthesize responderDelegate, delegate;
@synthesize validatorsList;

#pragma marl - Lifecycle
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.editable = YES;
        self.validatorsList = [[NSMutableArray alloc] init];
        [self postInit];
    }
    return self;
}

- (id)initWithFieldName:(NSString*)theFieldName
{
    self = [self initWithFrame:CGRectZero];
    if (self) {
        self.fieldName = theFieldName;
    }
    return self;
}

- (void)dealloc
{
    [self.validatorsList release];
    [self.fieldName release];
    [super dealloc];
}

- (void)postInit
{
    
}

- (void)viewDidAddedToForm
{
    
}

#pragma mark - View set up
- (void)setFrame:(CGRect)frame
{
    float height = [self fieldHeight];
    if (frame.size.height < height) {
        frame.size.height = height;
    }
    [super setFrame:frame];
}

- (CGFloat)fieldHeight
{
    return 88.0;
}

#pragma mark - Values
- (void)setFieldValue:(NSString *)newValue
{
    NSAssert(YES, @"Implement in child classes");
}

- (NSString*)fieldValue
{
    NSAssert(YES, @"Implement in child classes");
    return @"";
}

#pragma mark - Reset

-(void)reset
{
    //NSAssert(YES, @"Implement in child classes");
    
    [self hideErrorView];
    [self setFieldValue:nil];
}

#pragma mark - Touches
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (responderDelegate != nil) {
        [responderDelegate hideKeyBoard];
    }
}

//Responder chain
- (BOOL)becomeFirstResponder
{
    return NO;
}

- (BOOL)resignFirstResponder
{
    return NO;
}

- (BOOL)canBecomeFirstResponder
{
    return NO;
}

- (BOOL)canResignFirstResponder
{
    return NO;
}

- (BOOL)isFirstResponder
{
    return NO;
}

#pragma mark - Validate part
- (BOOL)validate:(NSError **)error
{
    BOOL isValid = YES;
    NSString *errorStr = @"";
    for (NSInteger i = 0; i < [self.validatorsList count]; i++) {
        ITBaseValidator *validator = [self.validatorsList objectAtIndex:i];
        if (![validator checkValue:[self fieldValue]]) {
            isValid = NO;
            errorStr = [errorStr stringByAppendingFormat:@"%@\n", validator.lastError];
        }
    }
    if (isValid) {
        [self hideErrorView];
    } else {
        *error = [NSError errorWithDomain:@"ITField" code:1 userInfo:[NSDictionary dictionaryWithObject:errorStr forKey:NSLocalizedDescriptionKey]];
        [self showErrorView];
    }
    return isValid;
}

- (UIView*)errorView
{
    UIImageView *errorView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"warning.png"]] autorelease];
    errorView.tag = ITFIELD_ERROR_VIEW;
    return errorView;
}

- (void)showErrorView
{
    UIView *errorView = [self viewWithTag:ITFIELD_ERROR_VIEW];
    if (errorView == nil) {
        errorView = [self errorView];
        [self addSubview:errorView];
    }
    errorView.center = CGPointMake(20, 20);
}

- (void)hideErrorView
{
    UIView *errorView = [self viewWithTag:ITFIELD_ERROR_VIEW];
    [errorView removeFromSuperview];
}

- (void)addValidator:(ITBaseValidator*)validator
{
    [self.validatorsList addObject:validator];
}

- (void)removeValidator:(ITBaseValidator*)validator
{
    [self.validatorsList removeObjectIdenticalTo:validator];
}


@end
