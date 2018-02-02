//
//  LGBAnimationZoomIn.m
//  ViewAnimation
//
//  Created by mac_256 on 2018/2/2.
//Copyright © 2018年 mac_256. All rights reserved.
//

#import "LGBAnimationZoomIn.h"

@implementation LGBAnimationZoomIn

#pragma mark ------------------------------------------------- 初始化 --------------------------------------------------

#pragma mark ------------------------------------------------- 公有方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 私有方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 代理方法 -------------------------------------------------
+(void)startAnimationOnView:(UIView *)view delay:(CGFloat)delay duration:(CGFloat)duration complete:(void (^)(void))complete
{
    if (!view) {
        return;
    }
    
    view.transform = CGAffineTransformMakeScale(1, 1);
    view.alpha = 1;
    
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations:^{
        view.transform = CGAffineTransformMakeScale(2, 2);
        view.alpha = 0;
    } completion:^(BOOL finished) {
        if (complete) {
            complete();
        }
    }];
}
#pragma mark ------------------------------------------------- 事件处理 -------------------------------------------------

#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------

@end
