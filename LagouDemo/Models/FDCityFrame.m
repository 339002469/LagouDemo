//
//  FDCityFrame.m
//  LagouDemo
//
//  Created by 范东 on 15/8/2.
//  Copyright (c) 2015年 范东. All rights reserved.
//
#import "FDCityListModel.h"
#import "FDCityFrame.h"

@implementation FDCityFrame
-(void)setModel:(FDCityListModel *)model
{
    _model=model;
    CGFloat margin=10;
    NSInteger row;
    //行数
    row=model.cityList.count/3;
    if (model.cityList.count%3) {
        row++;
    }
    _cellHeight=row*45+margin*2;
}
@end
