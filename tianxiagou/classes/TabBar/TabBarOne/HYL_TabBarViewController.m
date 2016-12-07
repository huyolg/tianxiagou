//
//  HYL_TabBarViewController.m
//  H_BMProject
//
//  Created by 胡永亮 on 16/7/8.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYL_TabBarViewController.h"
#import "HNavigationController.h"
#import "HYL_TabBar.h"
#import "HYLTypeViewController.h"
#import "HYLHomeViewController.h"
//#import "HYL_MediuViewController.h"
//#import "MineViewController.h"

@interface HYL_TabBarViewController ()<HYLTabBarDelegate>
@property (weak, nonatomic) HYL_TabBar *customTabBar;
@end

@implementation HYL_TabBarViewController

+ (HYL_TabBarViewController *)sharedHHTabBarController
{
    static dispatch_once_t onceToken;
    static HYL_TabBarViewController* tabVC = nil;
    if (tabVC == nil) {
        dispatch_once(&onceToken, ^{
            tabVC = [[HYL_TabBarViewController alloc] init];
        });
    }
    return tabVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.初始化tabbar
    [self setupTabBar];
    
    // 2.初始化子控制器
    [self setupChildViewControllers];
}



/**
 *  初始化TabBar
 */
- (void)setupTabBar
{
    HYL_TabBar *customTabBar = [[HYL_TabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

/**
 *  初始化子控制器
 */
- (void)setupChildViewControllers
{
    HYLHomeViewController *mainView = [[HYLHomeViewController alloc]init];
    [self setupChildViewController:mainView title:@"首页" imageName:@"tabBar_home" selectedImageName:@"tabBar_homeSec"];
    
    HYLTypeViewController *mediuVC = [[HYLTypeViewController alloc]init];
    [self setupChildViewController:mediuVC title:@"分类" imageName:@"tabBar_type" selectedImageName:@"tabBar_typeSec"];
    
    UIViewController *cartVC = [[UIViewController alloc]init];
    [self setupChildViewController:cartVC title:@"购物车" imageName:@"tabBar_cart" selectedImageName:@"tabBar_cartSec"];
    
    UIViewController *mineVC = [[UIViewController alloc]init];
    [self setupChildViewController:mineVC title:@"个人" imageName:@"tabBar_mine" selectedImageName:@"tabBar_mineSec"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 移除之前的4个UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) { //UITabBarButton
            [child removeFromSuperview];
        }
    }
}

/**
 *  tabBar选中了按钮
 *
 *  @param from   以前的位置
 *  @param to     现在的位置
 */
- (void)tabBar:(HYL_TabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

/**
 *  添加一个子控制器
 *
 *  @param vc                子控制器
 *  @param title             标题
 *  @param imageName         图片
 *  @param selectedImageName 选中的图片
 */
- (void)setupChildViewController:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置数据
    [vc.tabBarItem setImageInsets:UIEdgeInsetsMake(6, 0, -6, 0)];//UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
    
    vc.tabBarItem.image = [UIImage imageNamed:imageName];//[UIImage createImageWithColor:[UIColor colorWithHexString:@"0X123456"]];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];//[UIImage createImageWithColor:[UIColor colorWithHexString:@"0X345678"]];
    vc.tabBarItem.title = title;
    vc.navigationItem.title = title;
    // 2.包装
    HNavigationController *nav = [[HNavigationController alloc] initWithRootViewController:vc];
    [nav setupNavigationTheme];
    //nav.navigationBar.translucent = NO;
    //    if ([vc isEqual:[[HomeViewController alloc]init]]) {
    //        nav.navigationBarHidden = YES;
    //    }
    [self addChildViewController:nav];
    
    // 3.添加按钮
    //    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.customTabBar addTabBarButtonWithItem:vc.tabBarItem];
    
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
