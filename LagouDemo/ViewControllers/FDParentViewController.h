//
//  FDParentViewController.h
//  LagouDemo
//
//  Created by 范东 on 15/7/5.
//  Copyright (c) 2015年 范东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDCommonModel.h"
@interface FDParentViewController : UIViewController
{
    int _currentPage;
    NSMutableArray *_dataArray;
}
/**返回当前页面的URL*/
-(NSString *)currentUrl;
/**返回当前页面对应的Model*/
-(FDCommonModel *)currentModel;
/**数据请求方法*/
-(void)requestData;
/**请求成功*/
-(void)httpRequestFinished:(NSData *)data;
/**请求失败*/
-(void)httpRequestFailed:(NSError *)error;
@end
