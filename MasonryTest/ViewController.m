//
//  ViewController.m
//  MasonryTest
//
//  Created by allenzyq on 16/3/10.
//  Copyright © 2016年 AllenZyq. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "AppDelegate.h"
@interface ViewController ()
@property (nonatomic, strong) UILabel * label2;

@property (nonatomic, strong) CAGradientLayer * gradientLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test2];
 
    
}

- (void)test2 {
    UILabel * label = [[UILabel alloc]init];
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo (self.view.mas_centerY);
        make.left.equalTo(self.view).offset (30);
        make.right.equalTo(self.view.mas_right).offset (-30);
        make.height.equalTo (@20);
    }];
    label.backgroundColor = [UIColor blackColor];
    
    _label2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(label.frame), self.view.center.y, 1, 20)];
    [self.view addSubview:_label2];
//    _label2.backgroundColor = [UIColor redColor];
    
    [_label2 addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];

    
    [UIView animateWithDuration:3 animations:^{
        _label2.frame = CGRectMake(30, self.view.center.y-10, 300, 20);
    }];
    
//    渐变层
    _gradientLayer = [CAGradientLayer layer];
    _gradientLayer.frame = _label2.bounds;
    [_label2.layer addSublayer:_gradientLayer];
    
    _gradientLayer.startPoint = CGPointMake(0, 0);
    _gradientLayer.endPoint = CGPointMake(1, 0);
    
    self.gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor];
    
    
    
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    UILabel * label = (UILabel *)object;
    
    if ([keyPath isEqualToString:@"frame"]) {
        if (label.frame.size.width > 50) {
            label.backgroundColor = [UIColor yellowColor];
        }else {
            label.backgroundColor = [UIColor redColor];
        }
    }
    
}


- (void)test1 {
    
    UILabel * label1 = [[UILabel alloc]init];
    UILabel * label2 = [[UILabel alloc]init];
    UILabel * label3 = [[UILabel alloc]init];
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview: label3];
    
    label1.backgroundColor = [UIColor redColor];
    label2.backgroundColor = [UIColor greenColor];
    label3.backgroundColor = [UIColor yellowColor];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).offset (10);
        make.height.equalTo(@150);
        make.width.equalTo(label2);
    }];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1);
        make.left.equalTo (label1.mas_right).offset(10);
        make.width.equalTo(label1);
        make.height.equalTo(@150);
        
    }];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (label1);
        make.height.equalTo(@150);
        make.left.equalTo(label2.mas_right).offset(10);
        make.right.equalTo(self.view.mas_right).offset (-10);
        make.width.equalTo(label1);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
