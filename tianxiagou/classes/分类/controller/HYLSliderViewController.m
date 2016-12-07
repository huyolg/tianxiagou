//
//  HYLSliderViewController.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/1.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLSliderViewController.h"

@interface HYLSliderViewController ()
{
    NSArray *_controllers;
}

@end

@implementation HYLSliderViewController

- (instancetype)initWithControllers:(NSArray*)controllers
{
    self = [super init];
    if (self) {
        _controllers = controllers;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SELE_TYPE" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeType:) name:@"SELE_TYPE" object:nil];
    
    [self createSliderView];
}

- (void)createSliderView {
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
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
    
    
}



- (void)changeType:(NSNotification*)info
{
    NSLog(@"info %@",info);
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
