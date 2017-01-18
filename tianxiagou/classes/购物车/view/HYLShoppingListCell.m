//
//  HYLShoppingListCell.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/8.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLShoppingListCell.h"
#import "Masonry.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface HYLShoppingListCell ()
{
    BOOL _isSelected;
}
///商品头像
@property (nonatomic,strong) UIImageView *imgView;
///商品名称
@property (nonatomic,strong) UILabel *nameTitle;
///商品介绍
@property (nonatomic,strong) UILabel  *introMes;
///最新价格
@property (nonatomic,strong) UILabel *nowPrice;
///旧价格
@property (nonatomic,strong) UILabel *oldPrice;

@property (nonatomic,strong) UIButton *selecIcon;

@end

@implementation HYLShoppingListCell

- (UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc]init];
//        _imgView.frame = CGRectMake(10, 15, 25, 25);
        _imgView.layer.borderWidth = 1;
    }
    return _imgView;
}

- (UILabel *)nameTitle
{
    if (!_nameTitle) {
        _nameTitle = [[UILabel alloc]init];
        _nameTitle.numberOfLines = 2;
        _nameTitle.font = [UIFont systemFontOfSize:12];
    }
    return _nameTitle;
}

- (UILabel *)introMes
{
    if (!_introMes) {
        _introMes = [[UILabel alloc]init];
        _introMes.textColor = [UIColor grayColor];// = 2;
        _introMes.font = [UIFont systemFontOfSize:11];
    }
    return _introMes;
}

- (UILabel *)nowPrice
{
    if (!_nowPrice) {
        _nowPrice = [[UILabel alloc]init];
        _nowPrice.textColor = [UIColor redColor];
        _nowPrice.font = [UIFont systemFontOfSize:12];
    }
    return _nowPrice;
}

- (UIButton *)selecIcon
{
    if (!_selecIcon) {
        _selecIcon = [[UIButton alloc]init];
        [_selecIcon setBackgroundImage:[UIImage imageNamed:@"shop_select"] forState:UIControlStateNormal];
        [_selecIcon setBackgroundImage:[UIImage imageNamed:@"shop_selected"] forState:UIControlStateSelected];
        [_selecIcon addTarget:self action:@selector(selecAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selecIcon;
}

- (void)configCellWithModel:(ShoppingListModel*)model{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _isSelected = NO;
    
    CGSize size = CGSizeMake(self.frame.size.height-10, self.frame.size.height-10);
    model.imageName = @"http://c.hiphotos.baidu.com/zhidao/pic/item/5ab5c9ea15ce36d3c704f35538f33a87e950b156.jpg";//@"img1.jpg";
    UIImage *image = [UIImage imageNamed:@"img1.jpg"];
    image = [self clipImage:image toSize:size];
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.imageName] placeholderImage:[UIImage imageNamed:@"img1.jpg"]];
    
}

- (UIImage *)clipImage:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    
    CGSize imgSize = image.size;
    CGFloat x = MAX(size.width / imgSize.width, size.height / imgSize.height);
    CGSize resultSize = CGSizeMake(x*imgSize.width, x*imgSize.height);
    
    [image drawInRect:CGRectMake(0, 0, resultSize.width, resultSize.height)];
    
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return finalImage;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)selecAction
{
    if (_isSelected) {
        [_selecIcon setBackgroundImage:[UIImage imageNamed:@"shop_select"] forState:UIControlStateNormal];
    }else{
        [_selecIcon setBackgroundImage:[UIImage imageNamed:@"shop_selected"] forState:UIControlStateNormal];
    }
    _isSelected = !_isSelected;
}

- (void)drawRect:(CGRect)rect
{
    [self addSubview:self.selecIcon];
    [self.selecIcon mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self).offset(5);
        make.left.mas_equalTo(self).offset(5);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(25);
    }];
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
        make.left.mas_equalTo(self.selecIcon.mas_right).offset(10);
        make.width.mas_equalTo(self.frame.size.height-10);
    }];
    self.nameTitle.text = @"UI的时间发货时都是符合设计的收到货就放开手费时间快点发货时时间发货时间回复是多久发货师傅 收到回复是房价快速的身份和技术的发挥是地方海事局";
    [self addSubview:self.nameTitle];
    [self.nameTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgView.mas_top);
        make.left.mas_equalTo(self.imgView.mas_right).offset(10);
        make.right.mas_equalTo(self.mas_right).offset(-30);
    }];
    self.introMes.text =@"sjhsjfsfjsdhfsd京津冀的符号看世界的粉红色的积分骄傲和方法很简单发挥地方爱看机会多撒谎是大家";
    [self addSubview:self.introMes];
    [self.introMes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameTitle.mas_bottom).offset(5);
        make.left.mas_equalTo(self.nameTitle.mas_left);
        make.right.mas_equalTo(self.nameTitle.mas_right).offset(-10);
    }];
    self.nowPrice.text = @"98.00";
    [self addSubview:self.nowPrice];
    [self.nowPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameTitle.mas_left);
        make.bottom.mas_equalTo(self.imgView.mas_bottom);
    }];
    [self addSubview:self.oldPrice];
    
}

@end
