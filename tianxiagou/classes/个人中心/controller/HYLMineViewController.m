//
//  HYLMineViewController.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/9.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLMineViewController.h"
#import "UIBarButtonItem+Extend.h"
#import "Masonry.h"
#import "UIImage+Clip.h"
#import "MineTableViewCell.h"
#import "MineModel.h"
#import "HYLLoginViewController.h"
#import "HYLNavigationBar.h"

NSString *const identifierID = @"identifierID";

@interface HYLMineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) MineModel *mineMoel;

@property (nonatomic,strong) NSArray *arrTitle;

@property (nonatomic,strong) NSArray *arrIcon;

@end

@implementation HYLMineViewController

- (MineModel *)mineMoel
{
    if (!_mineMoel) {
        _mineMoel = [[MineModel alloc]init];
        _mineMoel.headerUrlStr = @"";
        _mineMoel.nickName = @"非法用户";
        _mineMoel.levelStr = @"酒剑仙";
    }
    return _mineMoel;
}

- (NSArray *)arrTitle
{
    if (!_arrTitle) {
        _arrTitle = @[@"我的积分",@"我的优惠券",@"售后",@"修改账号信息",@"修改密码",@"收货地址管理"];
    }
    return _arrTitle;
}

- (NSArray *)arrIcon
{
    if (!_arrIcon) {
        _arrIcon = @[@"myIntegral",@"coupon",@"mySale",@"account",@"changepwd",@"address"];
    }
    return _arrIcon;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"message" target:self action:@selector(comnicationShow)];

    [self createMineTableView];
}

- (void)createMineTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-50-64) style:UITableViewStyleGrouped];
    tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableHeaderView = [self resetTableHeardView];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    return self.arrTitle.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            return 88;
        }
        return 44;
    }
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierID];
    
    if (!cell) {
        cell = [[MineTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierID indexpath:indexPath];
    }
    cell.titleLabel.text = self.arrTitle[indexPath.row];
    cell.imgIcon.image = [UIImage imageNamed:self.arrIcon[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 3.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 6.5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HYLLoginViewController *loginVC = [[HYLLoginViewController alloc]init];
    loginVC.type = HYLNaviBarShowType_Needed;
    [self.navigationController presentViewController:loginVC animated:YES completion:^{
        nil;
    }];
}

- (UIView*)resetTableHeardView
{
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/5)];

    view.image = [UIImage imageNamed:@"mineBackIcon"];
    [self.view addSubview:view];
    
    UIVisualEffectView *visual = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    visual.frame = view.bounds;
    visual.alpha = 0.8f;
    [view addSubview:visual];
    //头像
    UIImageView *headerIcon = [[UIImageView alloc]init];
    headerIcon.layer.borderWidth = 3;
    headerIcon.backgroundColor = [UIColor whiteColor];
    headerIcon.layer.cornerRadius = ((self.view.frame.size.height/5)/4);
    headerIcon.layer.masksToBounds = YES;
    headerIcon.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.5].CGColor;
    UIImage *image = [UIImage imageNamed:@"default_heardIcon"];
    image = [UIImage clipImage:image toSize:CGSizeMake((self.view.frame.size.height/5), (self.view.frame.size.height/5))];
    headerIcon.image = image;
    [view addSubview:headerIcon];
    [headerIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view.mas_centerY);
        make.left.mas_equalTo(view.mas_left).offset(20);
        make.width.mas_equalTo((self.view.frame.size.height/5)/2);
        make.height.mas_equalTo((self.view.frame.size.height/5)/2);
    }];
    
    //昵称
    UILabel *nickName = [[UILabel alloc]init];
    nickName.text = @"登录/注册";
    nickName.textColor = [UIColor whiteColor];
    nickName.font = [UIFont systemFontOfSize:14];
    [view addSubview:nickName];
    [nickName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(headerIcon.mas_top).offset(10);
        make.left.mas_equalTo(headerIcon.mas_right).offset(10);
        make.width.mas_equalTo(view.frame.size.width/2);
    }];
    
    //会员等级
    UIButton *levelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [levelBtn addTarget:self action:@selector(showLevel) forControlEvents:UIControlEventTouchUpInside];
    [levelBtn setTitle:@"酒仙" forState:UIControlStateNormal];
    [levelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [levelBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    levelBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    levelBtn.layer.cornerRadius = 10;
    levelBtn.layer.masksToBounds = YES;
    levelBtn.backgroundColor = [UIColor colorWithWhite:0.6 alpha:0.4];
    [view addSubview:levelBtn];
    [levelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(headerIcon.mas_bottom).offset(-5);
        make.left.mas_equalTo(nickName);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(60);
    }];
    
    UILabel *accountControl = [[UILabel alloc]init];
    accountControl.text = @"账户管理>";
    accountControl.textColor = [UIColor whiteColor];
    accountControl.font = [UIFont systemFontOfSize:12];
    [view addSubview:accountControl];
    [accountControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view.mas_centerY);
        make.height.mas_equalTo(20);
        make.right.mas_equalTo(view.mas_right).offset(-20);
    }];
    
    return view;
}

- (void)showLevel
{
    NSLog(@"等级");
}

- (void)comnicationShow
{
    NSLog(@"00000");
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
