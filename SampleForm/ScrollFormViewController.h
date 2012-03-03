//
//  ScrollFormViewController.h
//  SampleForm
//
//  Created by mc816 on 03.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ITFormManager;

@interface ScrollFormViewController : UIViewController {
    ITFormManager *form;
}

- (void)collectValues;
- (void)validateForm:(id)sender;

@end
