//
//  HNavigationController.m
//  H_BMProject
//
//  Created by 胡永亮 on 16/7/6.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HNavigationController.h"
#import "UIColor+Hex.h"

@interface HNavigationController ()

@end

@implementation HNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//设置时间栏的颜色  高亮 UIStatusBarStyleLightContent
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

#pragma  mark - 设置导航栏主题方法;

- (void)setupNavigationTheme
{
    // 设置导航栏主题
    UINavigationBar *nvBar = [UINavigationBar appearance];
    // 设置导航栏颜色
    nvBar.barTintColor = [UIColor colorWithHexString:@"#e6e6e6"];//#1196db [UIColor colorWithHexString:@"0x444123"];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    // 设置文字颜色
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    // 设置字体
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [nvBar setTitleTextAttributes:textAttrs];
}

#pragma mark - 设置导航栏按钮主题;
+ (void)setupBarButtonItemTheme
{
    UIBarButtonItem *btnItem = [UIBarButtonItem appearance];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    // 设置文字颜色
    textAttrs[NSForegroundColorAttributeName] = [UIColor blueColor];
    // 设置字体
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    [btnItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
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
