//
//  ITScrollForm.m
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITScrollForm.h"
#import "ITFormManager.h"
#import "ITField.h"

@interface ITScrollForm()

@end

@implementation ITScrollForm
@synthesize formManager;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        subviewsChanged = YES;
        self.delegate = self;
        self.autoresizesSubviews = YES;
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

- (void)addField:(ITField*)field
{
    float height = [self contentHeight];
    CGSize contentSize = [self contentSize];
    //Set field height for 0, super class will set height
    field.frame = CGRectMake(0, height, self.bounds.size.width, 0);
    height += [field fieldHeight];
    [self addSubview:field];
    [field viewDidAddedToForm];
    contentSize.height = height;
    self.contentSize = contentSize;
    subviewsChanged = YES;
}

- (void)removeField:(ITField*)field
{
    subviewsChanged = YES;
}

- (void)setNeedReorderFields
{
    subviewsChanged = YES;
    [self layoutSubviews];
}

- (CGFloat)contentHeight
{
    return self.contentSize.height;
}

//Layout subviews positions

- (void)setFrame:(CGRect)frame
{
    subviewsChanged = YES;
    [super setFrame:frame];
}

- (void)layoutSubviews
{
    if (subviewsChanged) {
        float height = 0;
        float width = self.frame.size.width;
        for (UIView *subView in self.subviews) {
            if ([subView isKindOfClass:[ITField class]]) {
                CGRect frame = subView.frame;
                frame.origin.y = height;
                frame.origin.x = 0;
                frame.size.width = width;
                subView.frame = frame;
                height += frame.size.height;
            }
        }
        self.contentSize = CGSizeMake(width, height);
        subviewsChanged = NO;
    }
}

//Work with keyboard
- (void)didMoveToSuperview
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification*)notification
{
    /*
    oldOffset = self.contentOffset;
    CGPoint pt;
    CGRect rc = [[formManager respondedField] bounds];
    rc = [[formManager respondedField] convertRect:rc toView:self];
    pt = rc.origin;
    pt.x = 0;
    pt.y -= 60;
    [self setContentOffset:pt animated:YES];
    */
    
    
    
    
    NSDictionary *d = [notification userInfo];
    CGRect r = [[d objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    r = [self convertRect:r fromView:nil];
    
    UIEdgeInsets insets = self.contentInset;
    insets.bottom = r.size.height;
    self.contentInset = insets;
    insets = self.scrollIndicatorInsets;
    insets.bottom = r.size.height;
    self.scrollIndicatorInsets = insets;
}

- (void)keyboardWillHide:(NSNotification*)notification
{
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    oldOffset = self.contentOffset;
}

- (void)restoreNoKeyboardPosition
{
    /*
    CGPoint offset = oldOffset;
    if (offset.y < 0) {
        offset.y = 0;
    }
    if (self.contentSize.height > self.bounds.size.height) {
        if (offset.y > self.contentSize.height-self.bounds.size.height) {
            offset.y = self.contentSize.height-self.bounds.size.height;
        }
    } else {
        offset.y = 0;
    }
    [self setContentOffset:offset animated:YES];
    */
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.contentInset = contentInsets;
    self.scrollIndicatorInsets = contentInsets;
}

@end
