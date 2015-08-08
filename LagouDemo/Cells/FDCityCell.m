//
//  FDCityCell.m
//  LagouDemo
//
//  Created by qianfeng on 15-7-23.
//  Copyright (c) 2015年 范东. All rights reserved.
//
#import "FDCityListModel.h"
#import "FDCityCell.h"

@implementation FDCityCell

-(void)refreshWithArray:(NSArray *)array
{
    
    for (UIButton *button in self.contentView.subviews) {
        [button removeFromSuperview];
    }
    int totalColumns = 3;
    CGFloat buttonW = W/3;
    CGFloat buttonH = 45;
    CGFloat marginX = (W- totalColumns * buttonW) / (totalColumns + 1);
    CGFloat marginY = 0;
    for (int index = 0; index<array.count; index++) {
        UIButton *button = [[UIButton alloc]init];
        int row = index / totalColumns;
        int col = index % totalColumns;
        CGFloat buttonX = marginX + col * (buttonW + marginX);
        CGFloat buttonY = 10 + row * (buttonH + marginY);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [button setTitle:array[index] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"city_backimage"] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.contentView addSubview:button];
    }
}

-(void)onClick:(UIButton *)button
{
    //点击返回SearchVC
    NSLog(@"点击的城市:%@",button.titleLabel.text);
}

@end
