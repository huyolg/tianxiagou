//
//  HYLCollectionViewController.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/11/28.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLCollectionViewController.h"
#import "CollectionViewCell.h"
#import "ScaleFlowLayout.h"

//#define IdentifierCell @"collectionCell"
 NSString *const IdentifierCell = @"collectionCell";

@interface HYLCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation HYLCollectionViewController

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        ScaleFlowLayout *layout = [[ScaleFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.frame.size.height/3) collectionViewLayout:layout];
        [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:IdentifierCell];
        _collectionView.backgroundColor = [UIColor grayColor];
//        _collectionView.layer.borderWidth = 1;
        _collectionView.delegate = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.alwaysBounceVertical = NO;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (NSArray *)images
{
    if (!_images) {
        _images = [NSArray array];
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IdentifierCell forIndexPath:indexPath];
    [cell configWithImage:self.images[indexPath.item]];
    
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat x = CGRectGetMinX(scrollView.frame);
    NSLog(@"%f",x);
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
