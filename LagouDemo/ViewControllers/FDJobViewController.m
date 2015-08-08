//
//  FDJobViewController.m
//  LagouDemo
//
//  Created by 范东 on 15/7/5.
//  Copyright © 2015年 范东. All rights reserved.
//
#import "FDJobViewController.h"
#import "FDJobModel.h"
#import "FDJobCell.h"
#import "FDJobDetailViewController.h"
@interface FDJobViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation FDJobViewController
{
    UITableView *_tableView;
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    [self createTableView];
    _currentPage=1;
    [self requestData];
    /**解决循环引用*/
    __block typeof(self) blockSelf=self;
    [_tableView addLegendHeaderWithRefreshingBlock:^{
        [blockSelf->_dataArray removeAllObjects];
        _currentPage=1;
        [blockSelf requestData];
    }];
    [_tableView addLegendFooterWithRefreshingBlock:^{
        blockSelf->_currentPage++;
        [blockSelf requestData];
    }];
}

-(NSString *)currentUrl
{
    return [NSString stringWithFormat:JOB_URL,_currentPage];
}

-(FDCommonModel *)currentModel
{
    return [[FDJobModel alloc]init];
}

-(void)createTableView
{
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.rowHeight=100;
    [self.view addSubview:_tableView];
}

-(void)httpRequestFinished:(NSData *)data
{
    /**解析数据*/
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *contentDict=dict[@"content"];
    NSDictionary *dataDict=contentDict[@"data"];
    NSDictionary *pageDict=dataDict[@"page"];
    NSArray *resultArray=pageDict[@"result"];
    for (NSDictionary *listDict in resultArray) {
        FDJobModel *model=[FDJobModel modelWithDict:listDict];
        [_dataArray addObject:model];
    }
    [_tableView reloadData];
    [_tableView.header endRefreshing];
    [_tableView.footer endRefreshing];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FDJobCell *cell=[tableView dequeueReusableCellWithIdentifier:@"FDJobCellID"];
    if (cell==nil) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"FDJobCell" owner:nil options:nil].lastObject;
    }
    FDJobModel *model=_dataArray[indexPath.row];
    [cell.companyLogo setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",LAGOU,model.companyLogo]]];
    cell.companyName.text=model.companyName;
    cell.positionName.text=[NSString stringWithFormat:@"%@ [%@]",model.positionName,model.city];
    cell.createTime.text=model.createTime;
    cell.salary.text=model.salary;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FDJobDetailViewController *jc=[[FDJobDetailViewController alloc]init];
    FDJobModel *model=_dataArray[indexPath.row];
    jc.positionId=model.positionId;
    self.hidesBottomBarWhenPushed=YES;
    self.navigationController.navigationBar.hidden=YES;
    [self.navigationController pushViewController:jc animated:YES];
}
-(void)viewDidDisappear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed=NO;
}
@end
