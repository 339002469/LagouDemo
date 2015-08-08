//
//  FDJobCell.h
//  LagouDemo
//
//  Created by 范东 on 15/7/5.
//  Copyright (c) 2015年 范东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FDJobCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *companyLogo;
@property (weak, nonatomic) IBOutlet UILabel *companyName;
@property (weak, nonatomic) IBOutlet UILabel *positionName;
@property (weak, nonatomic) IBOutlet UILabel *salary;
@property (weak, nonatomic) IBOutlet UILabel *createTime;
@end
