//
//  HYLCollectionView.h
//  tianxiagou
//
//  Created by 胡永亮 on 2016/11/30.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYLCollectionView : UICollectionView

- (instancetype)initWithImages:(NSMutableArray*)images;

@property (nonatomic,strong) NSMutableArray *images;

@end
