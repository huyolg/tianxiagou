//
//  HYLChildViewController.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/1.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLChildViewController.h"
#import "HYLSliderViewController.h"

@interface HYLChildViewController ()

@end

@implementation HYLChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController *one = [[UIViewController alloc]init];
    one.view.backgroundColor = [UIColor orangeColor];
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
    
    HYLSliderViewController *sliderVC = [[HYLSliderViewController alloc]initWithControllers:subViewControllers];
    sliderVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self.view addSubview:sliderVC.view];
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
