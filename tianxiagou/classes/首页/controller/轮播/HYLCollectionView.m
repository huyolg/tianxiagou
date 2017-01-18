//
//  HYLCollectionView.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/11/30.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLCollectionView.h"
#import "CollectionViewCell.h"
#import "ScaleFlowLayout.h"

 NSString *const IdentifierCell = @"collectionCell";

@interface HYLCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation HYLCollectionView

- (NSArray *)images
{
    if (!_images) {
        _images = [NSArray array];
    }
    return _images;
}

- (instancetype)initWithImages:(NSArray*)images
{
    self = [super initWithFrame:CGRectZero collectionViewLayout:[[ScaleFlowLayout alloc]init]];
    if (self) {
        self.images = images;
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:IdentifierCell];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.images.count inSection:0];
            [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        });
        
    }
    return self;
}


- (NSInteger)numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    NSLog(@"self.images.count %ld",self.images.count);
    return self.images.count*100;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IdentifierCell forIndexPath:indexPath];
    [cell configWithImage:self.images[indexPath.item]];
    
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
