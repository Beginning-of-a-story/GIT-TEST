//
//  ViewController.m
//  拉线动画
//
//  Created by 张天 on 16/5/24.
//  Copyright © 2016年 深圳前海冰寒信息科技有限公司. All rights reserved.
//

#import "ViewController.h"
#define XMColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define TIME 0.3

@interface ViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic ,strong) OOView *myView;
@property (nonatomic ,strong) UIView *line;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:1];
    OOView *view = [[OOView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-100, 70, 20, 20)];
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    
    UIView *line = [[UIView alloc]init];
    line.frame = CGRectMake(0, 0, 2, view.frame.origin.y+1);
    line.center = CGPointMake(view.center.x, view.frame.origin.y/2);
    line.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line];
    self.line = line;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(viewPan:)];
    [view addGestureRecognizer:pan];
    pan.delegate = self;
    self.myView = view;
}

- (void)viewPan:(UIPanGestureRecognizer *)tap {
    CGPoint point = [tap locationInView:self.view];
    self.myView.center = point;
    
    self.line.frame = CGRectMake(0, 0, 2, self.myView.frame.origin.y+1);
    self.line.center = CGPointMake(self.myView.center.x, self.myView.frame.origin.y/2);
    if (tap.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.myView.frame = CGRectMake(self.view.frame.size.width-100, 70, 20, 20);
            self.line.frame = CGRectMake(0, 0, 2, self.myView.frame.origin.y+1);
            self.line.center = CGPointMake(self.myView.center.x, self.myView.frame.origin.y/2);
        } completion:^(BOOL finished) {
            [self createUI];
        }];
    }
}

- (void)createUI {
    
    UIColor *color1 = XMColor(12, 234, 87);
    UIColor *color2 = XMColor(55, 74, 84);
    UIColor *color3 = XMColor(215, 45, 7);
    UIColor *color4 = XMColor(78, 163, 15);
    NSArray *arr = @[color1,color2,color3,color4];

        
    UIView *view1 = [[UIView alloc]init];
    view1.backgroundColor = arr[0];
    view1.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 40);
    [self.view addSubview:view1];
    
    [UIView animateWithDuration:TIME animations:^{
        view1.frame = CGRectMake(0, self.view.frame.size.height-40, self.view.frame.size.width, 40);
    } completion:^(BOOL finished) {
        UIView *view2 = [[UIView alloc]init];
        view2.backgroundColor = arr[1];
        view2.frame = CGRectMake(0, self.view.frame.size.height-40, self.view.frame.size.width, 40);
        [self.view addSubview:view2];
        [self.view sendSubviewToBack:view2];
        [UIView animateWithDuration:TIME animations:^{
            view2.frame = CGRectMake(0, self.view.frame.size.height-40*2, self.view.frame.size.width, 40);
        } completion:^(BOOL finished) {
            UIView *view2 = [[UIView alloc]init];
            view2.backgroundColor = arr[2];
            view2.frame = CGRectMake(0, self.view.frame.size.height-40*2, self.view.frame.size.width, 40);
            [self.view addSubview:view2];
            [self.view sendSubviewToBack:view2];
            [UIView animateWithDuration:TIME animations:^{
                view2.frame = CGRectMake(0, self.view.frame.size.height-40*3, self.view.frame.size.width, 40);
            } completion:^(BOOL finished) {
                UIView *view2 = [[UIView alloc]init];
                view2.backgroundColor = arr[3];
                view2.frame = CGRectMake(0, self.view.frame.size.height-40*3, self.view.frame.size.width, 40);
                [self.view addSubview:view2];
                [self.view sendSubviewToBack:view2];
                [UIView animateWithDuration:TIME animations:^{
                   view2.frame = CGRectMake(0, self.view.frame.size.height-40*4, self.view.frame.size.width, 40);
                }];
            }];
        }];
    }];
}

@end

@implementation OOView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddArc(context, self.frame.size.width/2, self.frame.size.width/2, self.frame.size.width/2-2, 0, 2*M_PI, 1);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 2);
    CGContextStrokePath(context);
    
    CGContextRef context2 = UIGraphicsGetCurrentContext();
    CGContextAddArc(context2, self.frame.size.width/2, self.frame.size.width/2, 4, 0, 2*M_PI, 1);
    CGContextSetFillColorWithColor(context2, [UIColor redColor].CGColor);
    CGContextFillPath(context2);
}

@end