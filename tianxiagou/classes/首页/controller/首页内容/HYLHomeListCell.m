//
//  HYLHomeListCell.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/11/30.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLHomeListCell.h"

@implementation HYLHomeListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createFourButton];
    }
    return self;
}

- (void)createFourButton
{
    NSArray *arr = @[@"activity",@"preference",@"guanjia",@"experience"];
    CGFloat w = 30;
    
    CGFloat btn_w = (self.frame.size.width-4*w)/4;
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.frame = CGRectMake(w*i+btn_w*i+15*(i+1), 10, btn_w, btn_w);
        [btn setBackgroundImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
        [self addSubview:btn];
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
