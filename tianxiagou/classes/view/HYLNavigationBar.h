//
//  HYLNavigationBar.h
//  tianxiagou
//
//  Created by 胡永亮 on 2016/11/28.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    HYLNaviBarShowType_Needed,
    HYLNaviBarShowType_First,
    HYLNaviBarShowType_Other,
} HYLNavigationBarShowType;

@interface HYLNavigationBar : UIViewController

- (instancetype)initWithType:(HYLNavigationBarShowType)type;

//- (void) createNavigationBarWithSearch:(CGRect)frame;

@end
