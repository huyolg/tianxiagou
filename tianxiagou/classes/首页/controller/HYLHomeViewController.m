//
//  HYLHomeViewController.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/11/28.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLHomeViewController.h"
#import "HYLNavigationBar.h"
#import "HYLCollectionViewController.h"

@interface HYLHomeViewController ()

@end

@implementation HYLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    HYLNavigationBar *navigationBar = [[HYLNavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    [self.view addSubview:navigationBar.view];
    navigationBar.view.layer.borderWidth = 1;
    navigationBar.view.layer.borderColor = [UIColor redColor].CGColor;
    
    HYLCollectionViewController *collectionView = [[HYLCollectionViewController alloc]init];
    collectionView.view.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.frame.size.height/3);
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        NSString *fileName = [NSString stringWithFormat:@"%d.jpg",i];
        [images addObject:fileName];
    }
    collectionView.images = images;
//    NSLog(@"%@",images[1]);
    NSLog(@"")
    [self.view addSubview:collectionView.view];
    
//    [self.view bringSubviewToFront:navigationBar.view];
    
    
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
