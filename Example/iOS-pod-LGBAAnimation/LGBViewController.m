//
//  LGBViewController.m
//  iOS-pod-LGBAAnimation
//
//  Created by lgb789 on 02/02/2018.
//  Copyright (c) 2018 lgb789. All rights reserved.
//

#import "LGBViewController.h"
#import "LGBAnimation.h"
#import "AnimationTableView.h"
#import "AnimationModel.h"

@interface LGBViewController () <AnimationTableViewDelegate>
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) AnimationTableView *tableView;
@end

@implementation LGBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView = [[AnimationTableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    NSArray *data = @[
                      @[@"Bounce left", @"LGBAnimationBounceLeft"],
                      @[@"Bounce right", @"LGBAnimationBounceRight"],
                      @[@"Bounce down", @"LGBAnimationBounceDown"],
                      @[@"Bounce up", @"LGBAnimationBounceUp"],
                      @[@"Slide left", @"LGBAnimationSlideLeft"],
                      @[@"Slide right", @"LGBAnimationSlideRight"],
                      @[@"Slide down", @"LGBAnimationSlideDown"],
                      @[@"Slide up", @"LGBAnimationSlideUp"],
                      @[@"Fade in", @"LGBAnimationFadeIn"],
                      @[@"Fade Out", @"LGBAnimationFadeOut"],
                      @[@"Fade in left", @"LGBAnimationFadeInLeft"],
                      @[@"Fade in right", @"LGBAnimationFadeInRight"],
                      @[@"Fade in down", @"LGBAnimationFadeInDown"],
                      @[@"Fade in up", @"LGBAnimationFadeInUp"],
                      @[@"Pop", @"LGBAnimationPop"],
                      @[@"Morph", @"LGBAnimationMorph"],
                      @[@"Flash", @"LGBAnimationFlash"],
                      @[@"Shake", @"LGBAnimationShake"],
                      @[@"Zoom in", @"LGBAnimationZoomIn"],
                      @[@"Zoom out", @"LGBAnimationZoomOut"],
                      @[@"Slide down reverse", @"LGBAnimationSlideDownReverse"],
                      @[@"Fade out right", @"LGBAnimationFadeOutRight"],
                      @[@"Fade out left", @"LGBAnimationFadeOutLeft"],
                      @[@"Pop alpha", @"LGBAnimationPopAlpha"],
                      @[@"Pop alpha out", @"LGBAnimationPopAlphaOut"],
                      @[@"Pop alpha up", @"LGBAnimationPopAlphaUp"],
                      ];
    
    [self.tableView setupData:data];
}

-(void)test
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(handleRightBarButton)];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 30, 30)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    self.view1 = view;
    
    [self.view1 lgb_addAnimation:[LGBAnimationPop class] delay:0 duration:0.3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleRightBarButton
{
    [self.view1 lgb_startAnimationComplete:nil];
}

-(void)animationTableView:(AnimationTableView *)view didSelectedCircleView:(UIView *)circleView withAnimation:(NSString *)animation
{
    [circleView lgb_addAnimation:NSClassFromString(animation) delay:0 duration:0.3];
    [circleView lgb_startAnimationComplete:nil];
}

@end
