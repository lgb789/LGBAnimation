//
//  LGBAnimationPopAlphaOut.m
//  ViewAnimation
//
//  Created by mac_256 on 2018/2/2.
//Copyright © 2018年 mac_256. All rights reserved.
//

#import "LGBAnimationPopAlphaOut.h"

@implementation LGBAnimationPopAlphaOut

#pragma mark ------------------------------------------------- 初始化 --------------------------------------------------

#pragma mark ------------------------------------------------- 公有方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 私有方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 代理方法 -------------------------------------------------
+(void)startAnimationOnView:(UIView *)view delay:(CGFloat)delay duration:(CGFloat)duration complete:(void (^)(void))complete
{
    if (!view) {
        return;
    }
    
    // Start
    view.transform = CGAffineTransformMakeScale(1, 1);
    [UIView animateKeyframesWithDuration:duration/3 delay:delay options:0 animations:^{
        // End
        view.alpha = 1;
        view.transform = CGAffineTransformMakeScale(0.9, 0.9);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/3 delay:0 options:0 animations:^{
            // End
            view.transform = CGAffineTransformMakeScale(1.2, 1.2);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/3 delay:0 options:0 animations:^{
                // End
                view.alpha = 0;
                view.transform = CGAffineTransformMakeScale(1, 1);
            } completion:^(BOOL finished) {
                if (complete) {
                    complete();
                }
            }];
        }];
    }];
}
#pragma mark ------------------------------------------------- 事件处理 -------------------------------------------------

#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------

@end
