//
//  ScrollFormViewController.m
//  SampleForm
//
//  Created by mc816 on 03.03.12.
//  Copyright (c) 2012 ITC. All rights reserved.
//

#import "ScrollFormViewController.h"
#import "ITScrollForm.h"
#import "ITFormManager.h"

#import "TextField.h"
#import "SwitchField.h"
#import "TextView.h"
#import "ITLabelField.h"
#import "SpinnerField.h"
#import "SpinnerPicker.h"
#import "NumericField.h"
#import "DateTimePicker.h"
#import "DateTimeField.h"
#import "CurrencyField.h"

@implementation ScrollFormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect viewSize = self.view.bounds;
	ITScrollForm *scrollContent = [[ITScrollForm alloc] initWithFrame:CGRectMake(0, 0, viewSize.size.width, viewSize.size.height-40)];
    scrollContent.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:scrollContent];
    form = [[ITFormManager alloc] initWithContentManager:scrollContent];
    [scrollContent release];
    
    ITLabelField *lf = [[ITLabelField alloc] init];
    lf.titleLabel.text = @"Label";
    [form addField:lf];
    [lf release];
    
    TextField *f1 = [[TextField alloc] init];
    f1.titleLabel.text = @"Title view";
    f1.fieldName = @"f1";
    [form addField:f1];
    [f1 release];
    
    NumericField *nf = [[NumericField alloc] init];
    nf.titleLabel.text = @"Numeric field";
    nf.decimalPartSize = 10;
    nf.fieldName = @"nf1";
    nf.decimalSeparator = @",";
    [form addField:nf];
    [nf release];
    
    CurrencyField *cf = [[CurrencyField alloc] initWithFieldName:@"currency"];
    cf.titleLabel.text = @"Currency";
    cf.decimalSeparator = @".";
    cf.currencySymbol = @"$";
    [form addField:cf];
    [cf release];
    
    DateTimePicker *dtp = [[DateTimePicker alloc] init];
    
    DateTimeField *dtf = [[DateTimeField alloc] init];
    dtf.dataSelect = dtp;
    dtf.fieldName = @"datetime";
    [dtp release];
    dtf.titleLabel.text = @"Date Time Picker";
    [form addField:dtf];
    [dtf release];
    
    dtf = [[DateTimeField alloc] init];
    dtf.dataSelect = dtp;
    [dtp release];
    dtf.titleLabel.text = @"Date Picker";
    dtf.fieldName = @"date";
    dtf.fieldMode = ITDate;
    [form addField:dtf];
    [dtf release];
    
    dtf = [[DateTimeField alloc] init];
    dtf.dataSelect = dtp;
    [dtp release];
    dtf.titleLabel.text = @"Time Picker";
    dtf.fieldName = @"time";
    dtf.fieldMode = ITTime;
    [form addField:dtf];
    [dtf release];
    
    NSArray *items = [NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"Item 1", @"value", @"1", @"key", nil], [NSDictionary dictionaryWithObjectsAndKeys:@"Item 2", @"value", @"2", @"key", nil], [NSDictionary dictionaryWithObjectsAndKeys:@"Item 3", @"value", @"3", @"key", nil], nil];
    
    SpinnerPicker *spic = [[[SpinnerPicker alloc] init] autorelease];
    
    SpinnerField *sp = [[SpinnerField alloc] init];
    sp.dataSelect = spic;
    sp.items = items;
    sp.titleLabel.text = @"Spinner field";
    sp.fieldName = @"sp1";
    sp.displayKey = @"value";
    sp.valueKey = @"key";
    [form addField:sp];
    [sp release];
    
    SwitchField *sf = [[SwitchField alloc] init];
    sf.titleLabel.text = @"Switch Me!";
    sf.fieldName = @"sw1";
    [form addField:sf];
    [sf release];
    
    TextView *tv = [[TextView alloc] init];
    tv.titleLabel.text = @"Text View";
    tv.fieldName = @"tv1";
    [form addField:tv];
    tv.backgroundColor = [UIColor greenColor];
    [tv release];
    
    UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(0, viewSize.size.height - 40, viewSize.size.width, 40)];
    b.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    b.backgroundColor = [UIColor grayColor];
    [b setTitle:@"Values" forState:UIControlStateNormal];
    [b addTarget:self action:@selector(collectValues) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    [b release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    [form release];
}

- (void)dealloc
{
    [self viewDidUnload];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)collectValues
{
    NSDictionary *values = [form formValues];
    NSLog(@"Values %@", values);
}

@end
