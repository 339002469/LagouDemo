//
//  FDCommonModel.m
//  LagouDemo
//
//  Created by 范东 on 15/7/5.
//  Copyright (c) 2015年 范东. All rights reserved.
//

#import "FDCommonModel.h"

@implementation FDCommonModel
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)modelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
