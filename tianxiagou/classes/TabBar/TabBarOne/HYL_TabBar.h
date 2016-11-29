//
//  HYL_TabBar.h
//  H_BMProject
//
//  Created by 胡永亮 on 16/7/8.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HYL_TabBar;

@protocol HYLTabBarDelegate <NSObject>

@optional
/**
 *  HHTabBar上面的按钮被选中了
 *
 *  @param tabBar 被点击的HHTabBar
 *  @param from   原来按钮的位置
 *  @param to     新选中按钮的位置
 */
- (void)tabBar:(HYL_TabBar*)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

/**
 *  HHTabBar
 中间的加号按钮被点击了
 */
- (void)tabBarDidClickedPlusButton:(HYL_TabBar *)tabBar;

@end

@interface HYL_TabBar : UIView

//添加按钮
- (void)addTabBarButtonWithItem:(UITabBarItem*)item;

@property (nonatomic,assign)id<HYLTabBarDelegate>delegate;

@end
