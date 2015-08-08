//
//  FDSearchViewController.m
//  LagouDemo
//
//  Created by 范东 on 15/7/5.
//  Copyright © 2015年 范东. All rights reserved.
//
#import "FDCityViewController.h"
#import "FDSearchViewController.h"
#import "TFHpple.h"
@interface FDSearchViewController ()

@end

@implementation FDSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self analyzeHTML];
}
/**切换城市*/
-(void)createCityButtonWithTitle:(NSString *)title
{
    _cityBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 64, 80, 50)];
    [_cityBtn setTitle:title forState:UIControlStateNormal];
    [_cityBtn setImage:[UIImage imageNamed:@"city_select"] forState:UIControlStateNormal];
    [_cityBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_cityBtn addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_cityBtn];
}
/**城市选择事件*/
-(void)onClick
{
    FDCityViewController *cc=[[FDCityViewController alloc]init];
    [self.navigationController pushViewController:cc animated:YES];
}
/**解析HTML*/
-(void)analyzeHTML
{
    NSString *str=[NSString stringWithContentsOfURL:[NSURL URLWithString:CITY_HTML] encoding:NSUTF8StringEncoding error:nil];
    NSData *data=[str dataUsingEncoding:NSUTF8StringEncoding];
    TFHpple *xPathParser=[[TFHpple alloc]initWithHTMLData:data];
    NSString *xPathQuery=@"//span";
    NSArray *elements=[xPathParser searchWithXPathQuery:xPathQuery];
    TFHppleElement *element=elements[0];
    NSString *content=[element content];
    [self createCityButtonWithTitle:content];
}

@end
