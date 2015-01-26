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
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    [self layerDemo1];
    
}

#pragma mark - 图层属性演练
- (void)layerDemo1 {

    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(110, 100, 100, 100)];
    [myView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:myView];
    // 圆角
    [myView.layer setCornerRadius:50];
    // 边框
    [myView.layer setBorderColor:[UIColor blueColor].CGColor];
    [myView.layer setBorderWidth:3.0f];
    // 阴影(必须同时指定颜色、透明度、偏移量)
    [myView.layer setShadowColor:[UIColor blackColor].CGColor];
    [myView.layer setShadowOpacity:1.0f];
    [myView.layer setShadowOffset:CGSizeMake(10, 10)];
    
}

@end
