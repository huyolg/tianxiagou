//
//  UIButton_Line.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/20.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "UIButton_Line.h"
#import "Masonry.h"

@implementation UIButton_Line


- (void)createLineWithRect:(CGRect)contentRect
{
    UIView *lineLeft = [[UIView alloc]init];
    lineLeft.backgroundColor = [UIColor orangeColor];
    [self addSubview:lineLeft];
    [lineLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(self.frame.size.width/4);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(contentRect.size.height/2);
    }];
    
    UIView *lineRight = [[UIView alloc]init];
    lineRight.backgroundColor = [UIColor orangeColor];
    [self addSubview:lineRight];
    [lineRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.width.mas_equalTo(self.frame.size.width/4);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(contentRect.size.height/2);
    }];
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat w = contentRect.size.width/2;
    CGFloat x = w/2;
    CGFloat y = 0;
    CGFloat h = contentRect.size.height;
    [self createLineWithRect:(CGRect)contentRect];
    return CGRectMake(x, y, w, h);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
