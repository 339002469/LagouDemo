//
//  FDParentViewController.m
//  LagouDemo
//
//  Created by 范东 on 15/7/5.
//  Copyright (c) 2015年 范东. All rights reserved.
//

#import "FDParentViewController.h"
#import "FDHttpConnection.h"
@interface FDParentViewController ()

@end

@implementation FDParentViewController
{
    FDHttpConnection *_request;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataArray=[[NSMutableArray alloc]init];
    [self customNavigationBar];
}
-(void)customNavigationBar
{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake((W-160)/2, (44-30)/2, 160, 30)];
    imageView.image=[UIImage imageNamed:@"logo"];
    [self.navigationController.navigationBar addSubview:imageView];
}
-(NSString *)currentUrl
{
    return nil;
}
-(FDCommonModel *)currentModel
{
    return nil;
}
-(void)httpRequestFailed:(NSError *)error
{
    
}
-(void)httpRequestFinished:(NSData *)data
{
    
}
-(void)requestData
{
    _request=[[FDHttpConnection alloc]initWithURL:[self currentUrl] success:^(NSData *data) {
        [self httpRequestFinished:data];
    } failure:^(NSError *error) {
        [self httpRequestFailed:error];
    }];
}
@end
