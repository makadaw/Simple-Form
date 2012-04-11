//
//  ITSpinnerField.m
//  ITForm
//
//  Created by mc816 on 28.02.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ITSpinnerField.h"

@interface ITSpinnerField()
@property (readwrite, assign) UIButton *spinnerButton;
@property (readwrite, assign) UILabel *titleLabel;
@end

@implementation ITSpinnerField
@synthesize items, selectedItem;
@synthesize valueKey, displayKey;
@synthesize dataSelect;
@synthesize spinnerButton, titleLabel;

- (void)dealloc
{
    [self.items release];
    [self.dataSelect release];
    [self.valueKey release];
    [self.displayKey release];
    [super dealloc];
}

- (void)postInit
{
    self.spinnerButton = [[UIButton alloc] init];
    [self.spinnerButton addTarget:self action:@selector(spinnerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.spinnerButton];
    [self.spinnerButton setTitle:@"Select One" forState:UIControlStateNormal];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.titleLabel];
    [self.titleLabel release];
}

- (void)setFieldValue:(NSString *)newValue
{
    for (NSInteger i =0; [self.items count]; i++) {
        if ([[[self.items objectAtIndex:i] valueForKey:self.valueKey] isEqualToString:newValue]) {
            self.selectedItem = [self.items objectAtIndex:i];
            break;
        }
    }
}

- (NSString*)fieldValue
{
    if (self.selectedItem == nil) {
        return nil;
    } else {
        return [NSString stringWithFormat:@"%@", [self.selectedItem valueForKey:self.valueKey]];
    }
}

- (void)spinnerButtonAction:(id)sender
{
    if (self.dataSelect != nil) {
        [self.dataSelect spinnerField:self showSelectDialogWithItems:self.items];
    }
}

- (void)setSelectedItem:(id)theSelectedItem
{
    selectedItem = theSelectedItem;
    if (theSelectedItem == nil) {
        [self.spinnerButton setTitle:@"Select One" forState:UIControlStateNormal];
    } else {
        [self.spinnerButton setTitle:[selectedItem valueForKey:self.displayKey] forState:UIControlStateNormal];
    }
    
    if (self.delegate) {
        [self.delegate fieldDidChangeValue:self];
    }
}

-(void)reset
{
    [self hideErrorView];
    [self setSelectedItem:nil];
}

@end
