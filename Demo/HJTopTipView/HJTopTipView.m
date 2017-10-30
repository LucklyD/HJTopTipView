//
//  HJTopTipView.m
//  Demo
//
//  Created by Lucky on 2017/10/30.
//  Copyright © 2017年 bg. All rights reserved.
//

#import "HJTopTipView.h"

#define DE_W [UIScreen mainScreen].bounds.size.width
#define DE_H [UIScreen mainScreen].bounds.size.height
#define KViewHeight 64

@interface HJTopTipView(){
    UIImageView *_tipIcon;
    UILabel *_tipTitle;
}

@end

@implementation HJTopTipView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize_UI];
    }
    return self;
}

- (void)initialize_UI{
    _tipIcon = [[UIImageView alloc]initWithFrame:CGRectMake(16, 26, 24, 24)];
    _tipIcon.userInteractionEnabled = YES;
//    _tipIcon.transform = CGAffineTransformMakeScale(0.01, 0.01);
    [self addSubview:_tipIcon];
    
    _tipTitle = [[UILabel alloc]initWithFrame:CGRectMake(60, 16, DE_W - 120, 48)];
    _tipTitle.font = [UIFont boldSystemFontOfSize:16];
    _tipTitle.textColor = [UIColor whiteColor];
    _tipTitle.textAlignment = NSTextAlignmentCenter;
    _tipTitle.numberOfLines = 2;
    _tipTitle.lineBreakMode = NSLineBreakByWordWrapping;
    [self addSubview:_tipTitle];
    
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(hide)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [self addGestureRecognizer:recognizer];
}

+ (void)HJTipViewShowWithType:(TipType)type andTitle:(NSString *)title{
    HJTopTipView *tipView = [[HJTopTipView alloc]initWithFrame:CGRectMake(0, -KViewHeight, DE_W, KViewHeight)];
    [tipView setupViewWithType:type andTitle:title];
    [[UIApplication sharedApplication].keyWindow addSubview:tipView];
}

- (void)setupViewWithType:(TipType)type andTitle:(NSString *)title{
    _tipTitle.text = title;
    switch (type) {
        case TipType_Success:{
            self.backgroundColor = [UIColor colorWithRed:103.0f/255.0f green:177.0f/255.0f blue:48.0f/255.0f alpha:1.0f];
            _tipIcon.image = [UIImage imageNamed:@"success"];
        }
            break;
        case TipType_Info:{
            self.backgroundColor = [UIColor colorWithRed:49.0f/255.0f green:169.0f/255.0f blue:200.0f/255.0f alpha:1.0f];
            _tipIcon.image = [UIImage imageNamed:@"info"];
        }
            break;
        case TipType_Error:{
            self.backgroundColor = [UIColor colorWithRed:239.0f/255.0f green:66.0f/255.0f blue:70.0f/255.0f alpha:1.0f];
            _tipIcon.image = [UIImage imageNamed:@"error"];
        }
            break;
        default:
            break;
    }
    [self show];
}

- (void)show{
    __weak typeof (&*self) weakSelf = self;
    [UIView animateWithDuration:0.618 delay:0 usingSpringWithDamping:0.618 initialSpringVelocity:0.5 options:UIViewAnimationOptionLayoutSubviews animations:^{
        weakSelf.frame = CGRectMake(0, 0, DE_W, KViewHeight);
    } completion:^(BOOL finished) {
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0/*延迟执行时间*/ * NSEC_PER_SEC));
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            [weakSelf hide];
        });
    }];
}

- (void)hide{
    __weak typeof (&*self) weakSelf = self;
    [UIView animateWithDuration:0.618 animations:^{
        weakSelf.frame = CGRectMake(0, -KViewHeight, DE_W, KViewHeight);
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
}

@end
