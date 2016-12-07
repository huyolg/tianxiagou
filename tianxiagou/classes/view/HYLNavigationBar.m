//
//  HYLNavigationBar.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/11/28.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLNavigationBar.h"
#import "UIColor+Hex.h"

@implementation HYLNavigationBar

- (instancetype)init{
    self = [super init];
    if (self) {
        [self createNavigationBarWithSearch];
    }
    return self;
}

- (void) createNavigationBarWithSearch{
    UIView *navigationBar = [[UIView alloc]init];
    navigationBar.alpha = 0.5;
    navigationBar.backgroundColor = [UIColor whiteColor];
    navigationBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    [self.view addSubview:navigationBar];
    
    UIButton *btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLeft.frame = CGRectMake(15, 25, 25, 25);
    [btnLeft setBackgroundImage:[UIImage imageNamed:@"scan"] forState:UIControlStateNormal];
    [navigationBar addSubview:btnLeft];
//    btnLeft.layer.borderWidth = 1;
    UITextField *TFSearch = [[UITextField alloc]init];
    TFSearch.center = CGPointMake(self.view.frame.size.width/2, 8+64/2);
    TFSearch.borderStyle = UITextBorderStyleRoundedRect;
    TFSearch.leftView = [self createLeftView];
    TFSearch.leftViewMode = UITextFieldViewModeAlways;
    TFSearch.rightView = [self createRightView];
    TFSearch.rightViewMode = UITextFieldViewModeAlways;
    TFSearch.bounds = CGRectMake(0, 0, self.view.frame.size.width*2/3, 35);
    TFSearch.layer.masksToBounds = YES;
    TFSearch.layer.cornerRadius = 16;
    TFSearch.backgroundColor = [UIColor colorWithHexString:@"#e6e6e6"];
    TFSearch.placeholder = @"搜索商家、商品";
    TFSearch.textColor = [UIColor blackColor];
//    TFSearch.keyboardType = UIKeyboardTypeASCIICapableNumberPad;
    [navigationBar addSubview:TFSearch];
    
    UIButton *btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    btnRight.frame = CGRectMake(self.view.frame.size.width-40, 25, 25, 25);
    [btnRight setBackgroundImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
    [navigationBar addSubview:btnRight];
}

- (UIImageView*)createLeftView
{
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(5, 0, 15, 15)];
    view.image = [UIImage imageNamed:@"search"];
    return view;
}

- (UIImageView*)createRightView{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 0, 15, 15)];
    imageView.image = [UIImage imageNamed:@"recording"];
    return imageView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
