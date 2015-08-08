//
//  FDJobDetailViewController.m
//  LagouDemo
//
//  Created by 范东 on 15/7/5.
//  Copyright (c) 2015年 范东. All rights reserved.
//

#import "FDJobDetailViewController.h"
#import "SVProgressHUD.h"
@interface FDJobDetailViewController ()<UIWebViewDelegate>

@end

@implementation FDJobDetailViewController
{
    UIWebView *_webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self customNavigationBar];
    // Do any additional setup after loading the view.
    [self createWebView];
}
-(void)customNavigationBar
{
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:button];
    item.tintColor=[UIColor greenColor];
    self.navigationItem.leftBarButtonItem=item;
}
/**后退*/
-(void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)createWebView
{
    _webView=[[UIWebView alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
    _webView.delegate=self;
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:JOB_DETAIL,self.positionId]]];
    [_webView loadRequest:request];
    [self.view addSubview:_webView];
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [SVProgressHUD showWithStatus:@"加载中"];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [SVProgressHUD dismiss];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [SVProgressHUD dismiss];
}
@end
