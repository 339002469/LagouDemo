//
//  FDCityListModel.h
//  LagouDemo
//
//  Created by qianfeng on 15-7-23.
//  Copyright (c) 2015年 范东. All rights reserved.
//

#import "FDCommonModel.h"

@interface FDCityListModel : FDCommonModel
@property(nonatomic,retain)NSArray *cityList;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *nameStr;
@end
