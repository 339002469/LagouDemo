//
//  FDHttpConnection.h
//  Block-01
//
//  Created by iFD on 15/6/3.
//  Copyright (c) 2015年 iFD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDHttpConnection : NSObject<NSURLConnectionDataDelegate>

typedef void(^BlockSuccess)(NSData *);
typedef void(^BlockFailure)(NSError *);
/**初始化时指定一个网址,开始下载，成功了执行一段用户指定代码，失败了执行另外一段用户指定代码*/
-(instancetype)initWithURL:(NSString *)str success:(BlockSuccess)onSuccess failure:(BlockFailure)onFailure;
@end
