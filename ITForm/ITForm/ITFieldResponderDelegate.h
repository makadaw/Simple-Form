//
//  ITFieldResponderDelegate.h
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITField;

@protocol ITFieldResponderDelegate <NSObject>

- (void)startEditingField:(ITField*)field;
- (void)endEditingField:(ITField*)field;

- (void)hideKeyBoard;

@end
