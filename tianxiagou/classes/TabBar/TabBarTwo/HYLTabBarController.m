//
//  HYLTabBarController.m
//  百思不得姐
//
//  Created by 胡永亮 on 16/5/25.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLTabBarController.h"
#import "HNavigationController.h"
//#import "HYLEssenceViewController.h"
//#import "MineViewController.h"
//#import "NewViewController.h"
//#import "HYLFriendTrendsViewController.h"
#import "HYLTabBar.h"

@interface HYLTabBarController ()

@end

@implementation HYLTabBarController

+ (void)initialize
{
    //通过appearance同意设置所有的UITabBarItem的文字属性
    //后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控制器
    [self setupChildVc:[[UIViewController alloc] init] title:@"首页" image:@"tabBar_home" selectedImage:@"tabBar_homeSec" navigationTitle:@""];
    
    [self setupChildVc:[[UIViewController alloc] init] title:@"最新" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon" navigationTitle:@"百思不得姐"];
    
    [self setupChildVc:[[UIViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon" navigationTitle:@""];
    
    [self setupChildVc:[[UIViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon" navigationTitle:@"我的"];
    
    // 更换tabBar
    [self setValue:[[HYLTabBar alloc] init] forKeyPath:@"tabBar"];
}

- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage navigationTitle:(NSString*)navigationTitle
{
    //设置文字和图片
    vc.navigationItem.title = navigationTitle;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    //包装一个导航控制器，添加导航控制器为tabbarcontroller的子控制器
    HNavigationController *nav = [[HNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
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
