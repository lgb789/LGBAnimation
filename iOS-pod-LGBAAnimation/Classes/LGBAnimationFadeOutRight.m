//
//  LGBAnimationFadeOutRight.m
//  ViewAnimation
//
//  Created by mac_256 on 2018/2/2.
//Copyright © 2018年 mac_256. All rights reserved.
//

#import "LGBAnimationFadeOutRight.h"

@implementation LGBAnimationFadeOutRight

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
    view.alpha = 1;
    CGRect frame = [view convertRect:view.frame toView:nil];
    
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations:^{
        view.alpha = 0;
        view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth([UIScreen mainScreen].bounds) - CGRectGetMinX(frame), 0);
    } completion:^(BOOL finished) {
        if (complete) {
            complete();
        }
    }];
}
#pragma mark ------------------------------------------------- 事件处理 -------------------------------------------------

#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------

@end
