//
//  HYL_TabBar.m
//  H_BMProject
//
//  Created by 胡永亮 on 16/7/8.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYL_TabBar.h"
#import "HYL_TabBarButton.h"

@interface HYL_TabBar ()
@property (strong, nonatomic) NSMutableArray *tabBarButtons;
@property (weak, nonatomic) HYL_TabBarButton *selectedButton;
@property (weak, nonatomic) UIButton *plusButton;
@end

@implementation HYL_TabBar

- (NSMutableArray*)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [[NSMutableArray alloc]init];
    }
    return _tabBarButtons;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

//添加按钮 item类型
- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    //1.创建按钮
    HYL_TabBarButton *button = [[HYL_TabBarButton alloc]init];
    
    //2 传递数据模型
    button.item = item;
    
    //3 添加按钮
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    [self.tabBarButtons addObject:button];
    
    //默认选中
    if (self.tabBarButtons.count == 1) {
        [self buttonClick:button];
    }
}

//hyTabBarButton的点击事件
- (void)buttonClick:(HYL_TabBarButton*)button
{
    //代理通知
    if ([self.delegate respondsToSelector:@selector(tabBar: didSelectedButtonFrom: to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    //控制器选中
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

//布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    //3个按钮
    CGFloat buttonW = self.frame.size.width/self.tabBarButtons.count ;
//    NSLog(@"buttonW %f",buttonW);
    CGFloat buttonH = self.frame.size.height;
    for (int index = 0; index<self.tabBarButtons.count; index++) {
        HYL_TabBarButton *button = self.tabBarButtons[index];
        button.tag = index;
        button.frame = CGRectMake(index*buttonW, 0, buttonW+1, buttonH);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
