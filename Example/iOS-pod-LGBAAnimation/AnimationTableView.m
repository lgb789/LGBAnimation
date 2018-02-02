//
//  AnimationTableView.m
//  ViewAnimation
//
//  Created by mac_256 on 2018/2/1.
//Copyright © 2018年 mac_256. All rights reserved.
//

#import "AnimationTableView.h"
#import "AnimationTableViewCell.h"

@interface AnimationTableView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *data;
@end

@implementation AnimationTableView

#pragma mark ------------------------------------------------- 初始化 --------------------------------------------------
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView];
        self.tableView.frame = self.bounds;
    }
    return self;
}

#pragma mark ------------------------------------------------- 公有方法 -------------------------------------------------
-(void)setupData:(NSArray *)data
{
    self.data = data;
    [self.tableView reloadData];
}
#pragma mark ------------------------------------------------- 私有方法 -------------------------------------------------

#pragma mark ------------------------------------------------- 代理方法 -------------------------------------------------

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AnimationTableViewCell class])];
    if (cell == nil) {
        cell = [[AnimationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([AnimationTableViewCell class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.titleLabel.text = self.data[indexPath.row][0];
    cell.circleView.transform = CGAffineTransformIdentity;
    cell.circleView.alpha = 1;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimationTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [self.delegate animationTableView:self didSelectedCircleView:cell.circleView withAnimation:self.data[indexPath.row][1]];
}

#pragma mark ------------------------------------------------- 事件处理 -------------------------------------------------

#pragma mark ------------------------------------------------- 成员变量 -------------------------------------------------
-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}
@end
