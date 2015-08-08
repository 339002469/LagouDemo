//
//  FDCityFrame.h
//  LagouDemo
//
//  Created by 范东 on 15/8/2.
//  Copyright (c) 2015年 范东. All rights reserved.
//
@class FDCityListModel;
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface FDCityFrame : NSObject

@property(nonatomic,assign,readonly)CGFloat cellHeight;
@property(nonatomic,strong)FDCityListModel *model;

@end
