//
//  UIView+LGBAnimation.m
//  ViewAnimation
//
//  Created by mac_256 on 2018/2/1.
//  Copyright © 2018年 mac_256. All rights reserved.
//

#import "UIView+LGBAnimation.h"
#import <objc/runtime.h>

static const void *kAnimation;
static const void *kDelay;
static const void *kDuration;

@implementation UIView (LGBAnimation)

-(void)lgb_addAnimation:(Class<LGBAnimationDelegate>)animation delay:(CGFloat)delay duration:(CGFloat)duration
{
//    NSLog(@"add animation:%@", animation);
    objc_setAssociatedObject(self, &kAnimation, animation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &kDelay, @(delay), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &kDuration, @(duration), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)lgb_startAnimationComplete:(void(^)(void))complete
{
    Class<LGBAnimationDelegate> animation = objc_getAssociatedObject(self, &kAnimation);
    id delay = objc_getAssociatedObject(self, &kDelay);
    id duration = objc_getAssociatedObject(self, &kDuration);
    
    if ([animation respondsToSelector:@selector(startAnimationOnView:delay:duration:complete:)]) {
        [animation startAnimationOnView:self delay:[delay floatValue] duration:[duration floatValue] complete:complete];
    }
}

-(void)lgb_startCanvasAnimation
{
    [[self subviews] enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj lgb_startAnimationComplete:nil];
    }];
}

@end
