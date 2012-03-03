//
//  ITFieldDelegate.h
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ITFieldDelegate <NSObject>
@required
- (void)fieldDidChangeValue:(ITField*)field;

@end
