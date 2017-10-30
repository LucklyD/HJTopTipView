//
//  HJTopTipView.h
//  Demo
//
//  Created by Lucky on 2017/10/30.
//  Copyright © 2017年 bg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TipType) {
    TipType_Success,
    TipType_Info,
    TipType_Error,
};

@interface HJTopTipView : UIView

+ (void)HJTipViewShowWithType:(TipType)type andTitle:(NSString *)title;

@end
