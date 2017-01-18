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
#import "HYLCircleScrollView.h"

@interface HYLHomeViewController ()<HYLCircleScrollViewDelegate>

@property (nonatomic,strong) NSArray *imageArrs;

@end

@implementation HYLHomeViewController

- (NSArray *)imageArrs
{
    if (!_imageArrs) {
        _imageArrs = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"];
    }
    return _imageArrs;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    HYLNavigationBar *navigationBar = [[HYLNavigationBar alloc]initWithType:HYLNaviBarShowType_Other];
    navigationBar.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    [self.view addSubview:navigationBar.view];
    
    
    HYLHomeList *homeList = [[HYLHomeList alloc]init];
    homeList.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-64);
    [self.view addSubview:homeList];
    homeList.tableHeaderView = [self creatHeardView];
    
}

- (UIView*)creatHeardView
{
    CGFloat w = self.view.bounds.size.width;
    NSArray *imagesURLStrings = @[@"1.jpg",@"2.jpg",@"3.jpg"];
    HYLCircleScrollView *scrollView = [HYLCircleScrollView circleScrollViewWithFrame:CGRectMake(0, w, 0, w/2) delegate:self placeholderImage:[UIImage imageNamed:@"1.jpg"]] ;
    scrollView.layer.borderWidth = 1;
    scrollView.titlesGroup = @[@"1",@"2",@"3"];
    scrollView.pageControlAliment = HYLCircleScrollViewPageControlAlimentRight;
    scrollView.currentPageDotColor = [UIColor redColor];
    //         --- 模拟加载延迟
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        scrollView.imageURLStringsGroup = imagesURLStrings;
//    });
    return scrollView;
}

- (void)cycleScrollView:(HYLCircleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
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
