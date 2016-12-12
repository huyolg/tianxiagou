//
//  HYLShoppingListVC.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/7.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLShoppingListVC.h"
#import "HYLShoppingListCell.h"
#import "ShoppingListModel.h"

@interface HYLShoppingListVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HYLShoppingListVC

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self creatShoppingList];
}

- (void)creatShoppingList{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 84;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYLShoppingListCell *cell = [tableView dequeueReusableCellWithIdentifier:@""];
    if (!cell) {
        cell = [[HYLShoppingListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    }
    ShoppingListModel *model = [[ShoppingListModel alloc]init];
    [cell configCellWithModel:model];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
