//
//  ITScrollForm.h
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITFormContainerView.h"
@class ITFormManager, ITField;

@interface ITScrollForm : UIScrollView <ITFormContainerView, UIScrollViewDelegate> {
    BOOL subviewsChanged;
    UIEdgeInsets oldContentInset;
    UIEdgeInsets oldIndicatorInset;
    CGPoint oldOffset;
}

@property (assign) ITFormManager *formManager;

- (CGFloat)contentHeight;

- (void)keyboardWillShow:(NSNotification*)notification;
- (void)keyboardWillHide:(NSNotification*)notification;

@end
