//
//  HYLTypeShowViewController.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/6.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLTypeShowViewController.h"
#import "HYLTypeCollectionViewCell.h"
#import "typeModel.h"

NSString *const identifierCell = @"identifierCell";

@interface HYLTypeShowViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSMutableArray *dataArr;
}

@property (nonatomic,strong) UICollectionView *collectionView;;

@end

@implementation HYLTypeShowViewController

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake((self.view.frame.size.width-30-120)/3,(self.view.frame.size.width-120-30)/3 + 20 );
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-120, self.view.frame.size.height-50) collectionViewLayout:layout];
        [_collectionView registerClass:[HYLTypeCollectionViewCell class] forCellWithReuseIdentifier:identifierCell];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArr = [NSMutableArray array];
    for (NSInteger i = 1; i < 13; i++) {
        
        typeModel *model = [[typeModel alloc]init];;
        model.imageName = [NSString stringWithFormat:@"img%ld.jpg",(long)i];
        model.title = [NSString stringWithFormat:@"item%ld",i];
        [dataArr addObject:model];
        NSLog(@"datasouce %@",model.title);
    }
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HYLTypeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierCell forIndexPath:indexPath];
    typeModel *model = dataArr[indexPath.item];

    [cell configCellWithModel:model];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return dataArr.count;
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
