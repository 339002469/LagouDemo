//
//  FDJobModel.h
//  LagouDemo
//
//  Created by 范东 on 15/7/5.
//  Copyright (c) 2015年 范东. All rights reserved.
//

#import "FDCommonModel.h"

@interface FDJobModel : FDCommonModel
@property(nonatomic,copy)NSString *positionName;
@property(nonatomic,copy)NSString *positionId;
@property(nonatomic,copy)NSString *city;
@property(nonatomic,copy)NSString *createTime;
@property(nonatomic,copy)NSString *salary;
@property(nonatomic,copy)NSString *companyLogo;
@property(nonatomic,copy)NSString *companyName;
@property(nonatomic,copy)NSString *positionFirstType;
@end
