//
//  HYLCollectionViewController.h
//  tianxiagou
//
//  Created by 胡永亮 on 2016/11/28.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLBaseViewController.h"

@interface HYLCollectionViewController : HYLBaseViewController

- (instancetype)initWithImages:(NSMutableArray*)images;

@property (nonatomic,strong) NSMutableArray *images;

@end
