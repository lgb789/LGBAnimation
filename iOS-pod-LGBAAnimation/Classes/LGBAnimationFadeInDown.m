//
//  LGBAnimationFadeInDown.m
//  ViewAnimation
//
//  Created by mac_256 on 2018/2/1.
//Copyright © 2018年 mac_256. All rights reserved.
//

#import "LGBAnimationFadeInDown.h"

@implementation LGBAnimationFadeInDown

#pragma mark ------------------------------------------------- 初始化 --------------------------------------------------

#pragma mark ------------------------------------------------- 公有方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 私有方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 代理方法 -------------------------------------------------
+(void)startAnimationOnView:(UIView *)view delay:(CGFloat)delay duration:(CGFloat)duration complete:(void (^)(void))complete
{
    if (!view) {
        return;
    }
    
    view.transform = CGAffineTransformIdentity;
    view.alpha = 0;
    CGRect frame = [view convertRect:view.frame toView:nil];
    view.transform = CGAffineTransformMakeTranslation(0, -CGRectGetMaxY(frame));
    
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations:^{
        view.alpha = 1;
        view.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) {
        if (complete) {
            complete();
        }
    }];
}
#pragma mark ------------------------------------------------- 事件处理 -------------------------------------------------

#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------

@end
