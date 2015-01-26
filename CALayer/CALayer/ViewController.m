//
//  ViewController.m
//  CALayer
//
//  Created by Frankenstein Yang on 1/26/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(110, 100, 100, 100)];
    [myView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:myView];
    [myView.layer setCornerRadius:50];
    [myView.layer setBorderColor:[UIColor blueColor].CGColor];
    [myView.layer setBorderWidth:3.0f];
    
}

@end
