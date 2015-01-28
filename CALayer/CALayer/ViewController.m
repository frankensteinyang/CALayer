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

@property (nonatomic, weak) CALayer *myLayer;
@property (nonatomic, strong) NSArray *colors;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
//    [self layerDemo1];
//    [self layerDemo2];
    
    // 自定义图层
    CALayer *myLayer = [CALayer layer];
    myLayer.bounds = CGRectMake(0, 0, 100, 100);
    myLayer.position = CGPointMake(100, 100);
    myLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:myLayer];
    self.myLayer = myLayer;
    // 定义颜色数组
    self.colors = @[[UIColor redColor], [UIColor brownColor], [UIColor blueColor]];
}

#pragma mark - CALayer的隐式动画

#pragma mark 触摸事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    UITouch *touch = touches.anyObject;
    CGPoint location = [touch locationInView:self.view];
    // 位置
    self.myLayer.position = location;
    // 随机生成颜色
    NSInteger r = arc4random_uniform(self.colors.count);
    self.myLayer.backgroundColor = [self.colors[r] CGColor];
    // 透明度
    CGFloat alpha = arc4random_uniform(5) / 10.0 + 0.6;
    self.myLayer.opacity = alpha;
    // 旋转角度
    CGFloat angle = arc4random_uniform(180) / M_PI * 180;
    self.myLayer.transform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0);
    // 圆角属性
    NSInteger r1 = arc4random_uniform(50) + 20;
    self.myLayer.cornerRadius = r1;
    
}

#pragma mark - 形变属性（用KVC修改形变属性）
- (void)layerDemo2 {
    
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
    //    imageView.layer.transform = CATransform3DScale(imageView.layer.transform, 0.8, 0.8, 1.0);
    //    imageView.layer.transform = CATransform3DTranslate(imageView.layer.transform, 0, -100, 0);
    //    imageView.layer.transform = CATransform3DRotate(imageView.layer.transform, M_PI_4, 1.0, 1.0, 1.0);
    // 使用键值路径修改形变属性
    // KVC key value coding（键值编码：降低对象之间的耦合度）
    [imageView.layer setValue:@(0.5) forKeyPath:@"transform.scale"];
    [imageView.layer setValue:@(-100) forKeyPath:@"transform.translation.y"];
    [imageView.layer setValue:@(M_PI) forKeyPath:@"transform.rotation"];
    
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
