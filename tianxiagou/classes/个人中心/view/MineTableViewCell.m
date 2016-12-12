//
//  MineTableViewCell.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/12.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "MineTableViewCell.h"
#import "Masonry.h"
#import "UIButton+Reset.h"

@implementation MineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexpath:(NSIndexPath*)indexPath
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (indexPath.section == 0) {
       [self creatSectionOne];
    }
    
    return self;
}

- (void)creatSectionOne
{
    CGFloat MWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat DWidth = (MWidth-(8*20))/4;
    
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"img1.jpg"] forState:UIControlStateNormal];
        [btn setTitle:@"评价" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(20+(DWidth+40)*i);
            make.width.mas_offset(DWidth);
            make.top.mas_offset(10);
            make.bottom.mas_offset(-10);
        }];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
