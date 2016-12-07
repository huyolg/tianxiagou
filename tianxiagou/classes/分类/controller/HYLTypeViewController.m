//
//  HYLTypeViewController.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/11/30.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLTypeViewController.h"
#import "HYLNavigationBar.h"
#import "HYLChildViewController.h"
#import "HYLTypeShowViewController.h"

@interface HYLTypeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    HYLChildViewController *_childController;
    NSArray *_controllers;
    UIScrollView *scrollView;
}

@property (nonatomic,strong) NSArray *typeArrs;

@end

@implementation HYLTypeViewController

- (NSArray *)typeArrs
{
    if (!_typeArrs) {
        _typeArrs = @[@"热门推荐",@"潮流女装",@"品牌男装",@"个户化妆",@"家用电器",@"电脑办公"];
    }
    return _typeArrs;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        HYLTypeShowViewController *one = [[HYLTypeShowViewController alloc]init];
//        one.view.backgroundColor = [UIColor orangeColor];
        one.title = @"one";
        UIViewController *two = [[UIViewController alloc]init];
        two.view.backgroundColor = [UIColor redColor];
        two.title = @"two";
        UIViewController *three = [[UIViewController alloc]init];
        three.view.backgroundColor = [UIColor blueColor];
        three.title = @"three";
        UIViewController *four = [[UIViewController alloc]init];
        four.view.backgroundColor = [UIColor yellowColor];
        four.title = @"four";
        UIViewController *five = [[UIViewController alloc]init];
        five.view.backgroundColor = [UIColor greenColor];
        five.title = @"five";
        UIViewController *six = [[UIViewController alloc]init];
        six.view.backgroundColor = [UIColor grayColor];
        six.title = @"six";
        
        NSArray *subViewControllers = @[one,two,three,four,five,six];
        _controllers = subViewControllers;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    HYLNavigationBar *navigationBar = [[HYLNavigationBar alloc]init];
    navigationBar.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    [self.view addSubview:navigationBar.view];
    
    //创建左侧list
    [self creatLeftList];
    
    //创建右侧的商品
    [self addVCView];
    
    [self createSliderView];
}

- (void)addVCView
{
//    _childController = [[HYLChildViewController alloc]init];
//    _childController.view.frame = CGRectMake(120, 64, self.view.frame.size.width-120, self.view.frame.size.height-64-50);
////    childController.view.layer.borderWidth = 1;
//    [self.view addSubview:_childController.view];
}

- (void)createSliderView
{
    scrollView = [[UIScrollView alloc]init];
    scrollView.frame = CGRectMake(110, 64, self.view.frame.size.width-110, self.view.frame.size.height);
    [self.view addSubview:scrollView];
    
    scrollView.bounces = NO;
    //    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor lightGrayColor];
    
    NSUInteger count = _controllers.count;
    for (int i=0; i<count; i++) {
        UIViewController *vc = _controllers[i];
        [self addChildViewController:vc];
        vc.view.frame = CGRectMake(0, i*(self.view.frame.size.height), self.view.frame.size.width , self.view.frame.size.height);
        [scrollView addSubview:vc.view];
    }
    scrollView.contentSize = CGSizeMake(0, count*(self.view.frame.size.height));
    scrollView.pagingEnabled = YES;
    scrollView.scrollEnabled = NO;
    
//    _scrollView = scrollView;
}

- (void)creatLeftList
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 110, self.view.frame.size.height-50-64) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [self footView];
    [self.view addSubview:tableView];
}

- (UIView*)footView{
    UIView *view = [[UIView alloc]init];
    
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _controllers.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *const strCell = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
    }
    cell.textLabel.text = self.typeArrs[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    scrollView.contentOffset = CGPointMake(0, 64+(indexPath.row)*self.view.frame.size.height);

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
