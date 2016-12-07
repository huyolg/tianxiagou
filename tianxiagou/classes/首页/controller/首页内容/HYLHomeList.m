//
//  HYLHomeList.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/11/30.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLHomeList.h"
#import "HYLHomeListCell.h"

NSString *const identifier = @"IdentifierCell";

@interface HYLHomeList ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HYLHomeList

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.tableHeaderView = [self creatHeardView];
        [self registerClass:[HYLHomeListCell class] forCellReuseIdentifier:identifier];
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return self;
}



- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    return 13;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        CGFloat w = 30;
        CGFloat btn_w = (self.frame.size.width-4*w)/4;
        return (btn_w+10);
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYLHomeListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (!cell) {
        
        cell = [[HYLHomeListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
