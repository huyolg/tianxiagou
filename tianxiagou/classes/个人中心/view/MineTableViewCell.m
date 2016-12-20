//
//  MineTableViewCell.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/12.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "MineTableViewCell.h"
#import "Masonry.h"
#import "UIButton_Reset.h"
#import "UIButton_Num.h"

@implementation MineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexpath:(NSIndexPath*)indexPath
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self createAllOrder];
        }else{
            [self creatSectionOne];
        }
       
    }else{
        [self createSectionTwo];
    }
    
    return self;
}

- (void)createAllOrder
{
    CGFloat MHeight = self.frame.size.height;//[UIScreen mainScreen].bounds.size.height;
    CGFloat DHeight = MHeight/3;
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"全部订单";
    titleLabel.textColor = [UIColor grayColor];
    titleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(20);
        make.top.mas_offset(DHeight);
        make.bottom.mas_offset(-DHeight);
    }];
    
    UILabel *subLabel = [[UILabel alloc]init];
    subLabel.text = @"查看全部订单>";
    subLabel.textColor = [UIColor lightGrayColor];
    subLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:subLabel];
    [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(DHeight);
        make.bottom.mas_offset(-DHeight);
        make.right.mas_offset(-20);
    }];
}

- (void)creatSectionOne
{
    NSArray *arrIcon = @[@"willPay",@"willSend",@"willTake",@"willAppraise"];
    NSArray *arrTitle = @[@"待付款",@"代发货",@"待收货",@"待评价"];
    CGFloat MWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat DWidth = (MWidth-(8*20))/4;
    
    for (int i = 0; i < 4; i++) {
        UIButton_Reset *btn = [UIButton_Reset buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:arrIcon[i]] forState:UIControlStateNormal];
        [btn setTitle:arrTitle[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn addTarget:self action:@selector(payAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 100+i;
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(20+(DWidth+40)*i);
            make.width.mas_offset(DWidth);
            make.top.mas_offset(20);
            make.bottom.mas_offset(-20);
        }];
    }
}

- (void)createSectionTwo
{
    self.imgIcon = [[UIImageView alloc]init];

    [self addSubview:self.imgIcon];
    [self.imgIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(self.frame.size.height/4);
        make.bottom.mas_equalTo(self).offset(-self.frame.size.height/4);
        make.left.mas_equalTo(self).offset(self.frame.size.height/4);
        make.width.mas_offset(22);
    }];
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(10);
        make.left.mas_equalTo(self.imgIcon.mas_right).offset(15);
        make.bottom.mas_offset(-10);
    }];
    
    UIImageView *nextIcon = [[UIImageView alloc]init];
    nextIcon.image = [UIImage imageNamed:@"next"];
    [self addSubview:nextIcon];
    [nextIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_offset(-15);
        make.top.mas_equalTo(self).offset(14.5);
        make.bottom.mas_offset(-14.5);
        make.left.mas_equalTo(self.mas_right).offset(-self.frame.size.height+29-15);
    }];
}


- (void)payAction:(UIButton_Reset*)button
{
    if (button.tag == 100) {
        NSLog(@"代付款");
    }else if (button.tag == 101){
        NSLog(@"代发货");
    }else if (button.tag == 102){
        NSLog(@"待收货");
    }else{
        NSLog(@"待评价");
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
