//
//  HYLLoginViewController.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/12.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLLoginViewController.h"
#import "HYLNavigationBar.h"
#import "Masonry.h"
#import "UIImage+Clip.h"
#import "UIButton_Line.h"

@interface HYLLoginViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *userTF;

@property (nonatomic,strong) UITextField *passwordTF;

@end

@implementation HYLLoginViewController

- (UITextField *)userTF
{
    if (!_userTF) {
        _userTF = [[UITextField alloc]init];
        _userTF.layer.borderColor = [UIColor clearColor].CGColor;
        _userTF.returnKeyType = UIReturnKeyNext;
        
        _userTF.placeholder = @"请输入用户名";
        _userTF.delegate = self;
        _userTF.textAlignment = NSTextAlignmentCenter;
        _userTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _userTF.layer.cornerRadius = (self.view.frame.size.height/17)/2;
        _userTF.backgroundColor = [UIColor colorWithRed:155/255.0 green:242/255.0 blue:255/255.0 alpha:0.5];
    }
    return _userTF;
}

- (UITextField *)passwordTF
{
    if (!_passwordTF) {
        _passwordTF = [[UITextField alloc]init];
        _passwordTF.layer.borderColor = [UIColor clearColor].CGColor;
        _passwordTF.placeholder = @"请输入密码";
        _passwordTF.returnKeyType = UIReturnKeyDone;
        _passwordTF.delegate = self;
        _passwordTF.secureTextEntry = YES;
        _passwordTF.textAlignment = NSTextAlignmentCenter;
        _passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTF.layer.cornerRadius = (self.view.frame.size.height/17)/2;
        _passwordTF.backgroundColor = [UIColor colorWithRed:155/255.0 green:242/255.0 blue:255/255.0 alpha:0.5];
    }
    return _passwordTF;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //穿件渐变色
    [self ceateUIColor];
    
    UIButton *btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLeft.frame = CGRectMake(15, 25, 25, 25);
    [btnLeft setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [btnLeft addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLeft];
    
    [self createLoginUI];
    
}

- (void)createLoginUI
{
    CGFloat icon_W = self.view.frame.size.width/4.4;
    CGSize iconSize = CGSizeMake(icon_W, icon_W);
    UIImageView *iconImg = [[UIImageView alloc]init];
    UIImage *image = [UIImage imageNamed:@"iconImgFour"];
    image = [UIImage clipImage:image toSize:iconSize];
    iconImg.image = image;
    iconImg.layer.cornerRadius = icon_W/2;
    iconImg.layer.masksToBounds = YES;
    [self.view addSubview:iconImg];
    [iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX).offset(0);
        make.top.mas_equalTo(self).offset(icon_W);
        make.width.mas_equalTo(icon_W);
        make.height.mas_equalTo(icon_W);
    }];
    
    
    [self.view addSubview:self.userTF];
    [self.userTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(iconImg.mas_bottom).offset(65);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(self.view.frame.size.width-80);
        make.height.mas_equalTo(self.view.frame.size.height/17);
    }];
    
    [self.view addSubview:self.passwordTF];
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userTF.mas_bottom).offset(33);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(self.userTF.mas_width);
        make.height.mas_equalTo(self.userTF.mas_height);
    }];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.layer.cornerRadius = (self.view.frame.size.height/17)/2;
    [sureBtn setTitle:@"登录" forState:UIControlStateNormal];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sureBtn.backgroundColor = [UIColor orangeColor];
    [sureBtn addTarget:self action:@selector(sureLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTF.mas_bottom).offset(33);
        make.centerX.mas_equalTo(self.userTF.mas_centerX);
        make.width.mas_equalTo(self.userTF.mas_width).offset(0);
        make.height.mas_equalTo(self.userTF.mas_height).offset(0);
    }];
    
    UIButton_Line *signInBtn = [[UIButton_Line alloc]init];
//    signInBtn.layer.borderWidth = 1;
    [signInBtn setTitle:@"手机快速注册" forState:UIControlStateNormal];
    signInBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    signInBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [signInBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    [self.view addSubview:signInBtn];
    [signInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(sureBtn.mas_bottom).offset(35);
        make.centerX.mas_equalTo(sureBtn.mas_centerX);
        make.width.mas_equalTo(sureBtn.mas_width).offset(-50);
    }];
    
    UIButton *forgotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgotBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgotBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [forgotBtn setTitleColor:[UIColor colorWithWhite:1.0 alpha:0.5] forState:UIControlStateNormal];
    
    [self.view addSubview:forgotBtn];
    [forgotBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(signInBtn.mas_bottom).offset(15);
        make.centerX.mas_equalTo(sureBtn.mas_centerX);
    }];
    NSArray *arrQW = @[@"weChat",@"QQ"];
    for (int i = 0; i < 2; i++) {
        UIButton *chatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [chatBtn setBackgroundImage:[UIImage imageNamed:arrQW[i]] forState:UIControlStateNormal];
        chatBtn.tag = 1000+i;
        [chatBtn addTarget:self action:@selector(thirdpartyLogin:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:chatBtn];
        [chatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-60);
            make.centerX.mas_equalTo(-(self.view.frame.size.width)/4 + i*(self.view.frame.size.width/2));
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(50);
        }];
    }
}

- (void)ceateUIColor
{
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = self.view.bounds;
    /*
     // 创建渐变色数组，需要转换为CGColor颜色
     gradientLayer.colors = @[(id)[UIColor whiteColor].CGColor,(id)kRGBColor(30, 144, 255, 1).CGColor];
     
     // 设置颜色分割点
     gradientLayer.locations = @[@(0.1f) ,@(1)];
     */
    
    //颜色分配:四个一组代表一种颜色(r,g,b,a)
    layer.colors = @[(__bridge id) [UIColor colorWithRed:155/255.0 green:212/255.0 blue:255/255.0 alpha:1.0].CGColor,
                     (__bridge id) [UIColor colorWithRed:197/255.0 green:139/255.0 blue:193/255.0 alpha:1.0].CGColor];
    layer.locations = @[@(0.1f) ,@(1)];
    //起始点
    layer.startPoint = CGPointMake(0, 0);
    //结束点
    layer.endPoint = CGPointMake(1, 0);
    
    [self.view.layer addSublayer:layer];
}
///确定登录
- (void)sureLogin
{

}

///第三方登录
- (void)thirdpartyLogin:(UIButton*)button
{
    if (button.tag == 1000) {
        NSLog(@"WECHAT");
    }else if (button.tag == 1001){
        NSLog(@"QQDENGL");
    }
}


- (void)cancelAction
{
    [self dismissViewControllerAnimated:YES completion:^{
        nil;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.userTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.userTF) {
        [self.passwordTF becomeFirstResponder];
    }else
        [textField resignFirstResponder];
    return YES;
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
