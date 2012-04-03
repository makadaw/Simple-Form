//
//  ITFormContainerView.h
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ITFormManager, ITField, ITFieldSet;

@protocol ITFormContainerView <NSObject>
@required
- (void)setFormManager:(ITFormManager*)formManager;

- (void)addField:(ITField*)field;
- (void)removeField:(ITField*)field;

- (void)addFieldSet:(ITFieldSet*)fieldSet;

- (void)restoreNoKeyboardPosition;
- (void)setNeedReorderFields;

@end
