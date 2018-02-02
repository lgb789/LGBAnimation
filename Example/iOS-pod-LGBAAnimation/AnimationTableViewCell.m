//
//  AnimationTableViewCell.m
//  ViewAnimation
//
//  Created by mac_256 on 2018/2/1.
//Copyright © 2018年 mac_256. All rights reserved.
//

#import "AnimationTableViewCell.h"

@implementation AnimationTableViewCell

#pragma mark ------------------------------------------------- 初始化 --------------------------------------------------
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.circleView];
        
        self.circleView.frame = CGRectMake(15, 10, 40, 40);
        self.circleView.layer.cornerRadius = 20;
        self.circleView.layer.masksToBounds = YES;
        self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.circleView.frame) + 10, 0, 150, 60);
    }
    return self;
}

#pragma mark ------------------------------------------------- 公有方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 私有方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 代理方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 事件处理 -------------------------------------------------

#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------
-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [UILabel new];
        
    }
    return _titleLabel;
}

-(UIView *)circleView
{
    if (_circleView == nil) {
        _circleView = [UIView new];
        _circleView.backgroundColor = [UIColor redColor];
    }
    return _circleView;
}
@end
