//
//  HYLTypeViewController.h
//  tianxiagou
//
//  Created by 胡永亮 on 2016/11/30.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLBaseViewController.h"

@protocol SelectTypeDelegate <NSObject>

- (void)selectTypeWithInteger:(NSInteger)integer;

@end

@interface HYLTypeViewController : HYLBaseViewController

@end
