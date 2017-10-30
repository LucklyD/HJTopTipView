//
//  ViewController.m
//  Demo
//
//  Created by Lucky on 2017/10/23.
//  Copyright © 2017年 bg. All rights reserved.
//

#import "ViewController.h"
#import "HJTopTipView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    float width = self.view.frame.size.width / 3.0f;
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(width * i, 200, width, 100)];
        btn.backgroundColor = [UIColor colorWithRed:[self getRandom]/255.0f green:[self getRandom]/255.0f blue:[self getRandom]/255.0f alpha:1];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

- (void)btnClick:(UIButton *)sender{
    switch (sender.tag) {
        case 0:
            [HJTopTipView HJTipViewShowWithType:TipType_Success andTitle:@"成功！！"];
            break;
        case 1:
            [HJTopTipView HJTipViewShowWithType:TipType_Info andTitle:@"提示！！"];
            break;
        case 2:
            [HJTopTipView HJTipViewShowWithType:TipType_Error andTitle:@"失败！！"];
            break;
        default:
            break;
    }
}

- (int)getRandom{
    return arc4random() % 255;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
