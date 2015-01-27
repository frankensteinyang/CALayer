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
//    [self layerDemo1];
    
    UIImage *image = [UIImage imageNamed:@"01.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(30, 200, 320, 240)];
    // 在UIImageView中，图层不止一个，如果要设置圆角属性，需要设置一个“遮罩”属性
    // 此属性的目的是让所有图层跟随父图层一起变化
    [imageView.layer setMasksToBounds:YES];
    [self.view addSubview:imageView];
    [imageView.layer setCornerRadius:50];
    [imageView.layer setBorderWidth:5.0f];
    [imageView.layer setBorderColor:[UIColor whiteColor].CGColor];
    // 如果使用阴影，遮罩属性不能设置为YES,具体使用需要取舍
    [imageView.layer setShadowOffset:CGSizeMake(10, 10)];
    [imageView.layer setShadowOpacity:1.0f];
    [imageView.layer setShadowColor:[UIColor blackColor].CGColor];
    // 形变属性
    imageView.layer.transform = CATransform3DScale(imageView.layer.transform, 0.8, 0.8, 1.0);
    imageView.layer.transform = CATransform3DTranslate(imageView.layer.transform, 0, -100, 0);
    imageView.layer.transform = CATransform3DRotate(imageView.layer.transform, M_PI_2, 0.0, 0.0, 1.0);
    
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
