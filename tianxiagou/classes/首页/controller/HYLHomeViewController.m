//
//  HYLHomeViewController.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/11/28.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLHomeViewController.h"
#import "HYLNavigationBar.h"
//#import "HYLCollectionViewController.h"
#import "HYLCollectionView.h"
#import "HYLHomeList.h"

@interface HYLHomeViewController ()

@end

@implementation HYLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    HYLNavigationBar *navigationBar = [[HYLNavigationBar alloc]init];
    navigationBar.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    [self.view addSubview:navigationBar.view];
    
    HYLHomeList *homeList = [[HYLHomeList alloc]init];
    homeList.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-64);
    [self.view addSubview:homeList];
    homeList.tableHeaderView = [self creatHeardView];
    
}

- (UIView*)creatHeardView
{
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width/2);
    imageView.image = [UIImage imageNamed:@"1.jpg"];
    return imageView;
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
