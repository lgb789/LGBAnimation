//
//  AnimationTableView.h
//  ViewAnimation
//
//  Created by mac_256 on 2018/2/1.
//Copyright © 2018年 mac_256. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnimationTableView;

@protocol AnimationTableViewDelegate <NSObject>

-(void)animationTableView:(AnimationTableView *)view didSelectedCircleView:(UIView *)circleView withAnimation:(NSString *)animation;

@end

@interface AnimationTableView : UIView

@property (nonatomic, weak) id<AnimationTableViewDelegate> delegate;

-(void)setupData:(NSArray *)data;

@end
