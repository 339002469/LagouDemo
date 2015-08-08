//
//  FDCityViewController.m
//  LagouDemo
//
//  Created by 范东 on 15/7/5.
//  Copyright (c) 2015年 范东. All rights reserved.
//

#import "FDCityViewController.h"
#import "FDSearchViewController.h"
#import "FDCityListModel.h"
#import "FDCityCell.h"
#import "FDCityFrame.h"
@interface FDCityViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>

@end

@implementation FDCityViewController
{
    NSMutableArray *_dataArray;
    UITableView *_tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customNavigationBar];
    [self createTableView];
    [self analyzeHTML];
}
-(void)customNavigationBar
{
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [button setTitle:@"" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:button];
    item.tintColor=[UIColor greenColor];
    self.navigationItem.leftBarButtonItem=item;
    self.navigationController.interactivePopGestureRecognizer.delegate=self;
}
/**解析HTML*/
-(void)analyzeHTML
{
    NSString *str=[NSString stringWithContentsOfURL:[NSURL URLWithString:CITY_HTML] encoding:NSUTF8StringEncoding error:nil];
    NSData *data=[str dataUsingEncoding:NSUTF8StringEncoding];
    TFHpple *xPathParser=[[TFHpple alloc]initWithHTMLData:data];
    NSString *xPathQuery=@"//script";
    NSArray *elements=[xPathParser searchWithXPathQuery:xPathQuery];
    TFHppleElement *element=elements[9];
    NSString *content=[element content];
    NSArray *array=[content componentsSeparatedByString:@";"];
    NSArray *dictArray=[array[3] componentsSeparatedByString:@"="];
    NSString *string=dictArray[1];
    NSData *stringData=[string dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *cityLists=[NSJSONSerialization JSONObjectWithData:stringData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"沙盒Plist路径:%@",[NSHomeDirectory() stringByAppendingString:@"/Documents/CityList.plist"]);
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *filename=[path stringByAppendingPathComponent:@"CityList.plist"];
    NSFileManager *fm=[NSFileManager defaultManager];
    NSArray *testArray=[NSArray arrayWithContentsOfFile:filename];
    if (!testArray) {
        
        [fm createFileAtPath:filename contents:nil attributes:nil];
        [cityLists writeToFile:filename atomically:YES];
    }
    for (NSDictionary *cityList in testArray) {
        FDCityListModel *model=[FDCityListModel modelWithDict:cityList];
        FDCityFrame *frameModel=[[FDCityFrame alloc]init];
        frameModel.model=model;
        [_dataArray addObject:model];
    }
    [_tableView reloadData];
}
-(void)createTableView
{
    _dataArray=[[NSMutableArray alloc]init];
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FDCityCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell==nil) {
        cell=[[FDCityCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    FDCityListModel *model=_dataArray[indexPath.section];
    [cell refreshWithArray:model.cityList];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, W, 20)];
    view.backgroundColor=[UIColor whiteColor];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, W, 18)];
    [view addSubview:label];
    
    FDCityListModel *model=_dataArray[section];
    label.text=[NSString stringWithFormat:@"%@",model.nameStr];
    label.textAlignment=NSTextAlignmentLeft;
    label.font=[UIFont systemFontOfSize:15];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FDCityListModel *model=_dataArray[indexPath.section];
    FDCityFrame *frameModel=[[FDCityFrame alloc]init];
    frameModel.model=model;
    return frameModel.cellHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

@end
