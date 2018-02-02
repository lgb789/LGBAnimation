//
//  UIView+LGBAnimation.h
//  ViewAnimation
//
//  Created by mac_256 on 2018/2/1.
//  Copyright © 2018年 mac_256. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LGBAnimationDelegate <NSObject>

+(void)startAnimationOnView:(UIView *)view delay:(CGFloat)delay duration:(CGFloat)duration complete:(void(^)(void))complete;

@end

@interface UIView (LGBAnimation)

/**
 添加动画

 @param animation 动画类，必须实现LGBAnimationDelegate协议
 @param delay 延时执行的秒数
 @param duration 动画持续时间
 */
-(void)lgb_addAnimation:(Class<LGBAnimationDelegate>)animation delay:(CGFloat)delay duration:(CGFloat)duration;

/**
 开始执行动画

 @param complete 动画执行完后进行的操作
 */
-(void)lgb_startAnimationComplete:(void(^)(void))complete;

/**
 执行当前view所有subview的动画
 */
-(void)lgb_startCanvasAnimation;

@end
