//
//  FDTabBarController.m
//  LagouDemo
//
//  Created by 范东 on 15/7/5.
//  Copyright © 2015年 范东. All rights reserved.
//
#define NORMAL_IMAGES @[@"job_normal",@"search_normal",@"my_normal"]
#define SELECT_IMAGES @[@"job_highlighted",@"search_highlighted",@"my_highlighted"]
#define BUTTON_TITLES @[@"职",@"搜",@"我"]
#import "FDTabBarController.h"
#import "FDJobViewController.h"
#import "FDSearchViewController.h"
#import "FDMyViewController.h"
@interface FDTabBarController ()

@end

@implementation FDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customTabBar];
}
/**自定义TabBar*/
-(void)customTabBar
{
    self.tabBar.hidden=YES;
    UIImageView *imageView=[self createImageView];
    for (NSUInteger i=0; i<3; i++) {
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*0.03+i*(self.view.bounds.size.width/3), -25, 48, 98)];
        [button setTitle:BUTTON_TITLES[i] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont boldSystemFontOfSize:15];
        [self customButton:button index:i];
        imageView.userInteractionEnabled=YES;
        [imageView addSubview:button];
    }
}
/**创建ImageView*/
-(UIImageView *)createImageView
{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-49, self.view.bounds.size.width, 49)];
    imageView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:imageView];
    return imageView;
}
/**自定义Button*/
-(void)customButton:(UIButton *)button index:(NSUInteger)index
{
    [button setImage:[UIImage imageNamed:NORMAL_IMAGES[index]] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:SELECT_IMAGES[index]] forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:SELECT_IMAGES[index]] forState:UIControlStateHighlighted];
    button.adjustsImageWhenHighlighted=NO;
    
    button.tag=100+index;
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchDown];
}
/**点击事件*/
-(void)onClick:(UIButton *)button
{
    [button setImage:[UIImage imageNamed:SELECT_IMAGES[button.tag-100]] forState:UIControlStateNormal];
    for (NSUInteger i=100; i<103; i++)
    {
        UIButton *bt=(UIButton *)[self.view viewWithTag:i];
        if (bt!=button)
        {
            [bt setImage:[UIImage imageNamed:NORMAL_IMAGES[i-100]] forState:UIControlStateNormal];
        }
    }
    self.selectedIndex=button.tag-100;
}
@end
