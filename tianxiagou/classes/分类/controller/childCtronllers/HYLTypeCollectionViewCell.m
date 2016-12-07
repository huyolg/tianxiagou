//
//  HYLTypeCollectionViewCell.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/6.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "HYLTypeCollectionViewCell.h"

@interface HYLTypeCollectionViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *imageView;


@end

@implementation HYLTypeCollectionViewCell

- (UIView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIView alloc]init];
        _imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width);
        _imageView.layer.borderWidth = 1;
        _imageView.layer.borderColor = [UIColor redColor].CGColor;
    }
    return _imageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.frame = CGRectMake(0, self.frame.size.height-20, self.frame.size.width, 20);
        _titleLabel.numberOfLines =0;
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.backgroundColor = [UIColor blackColor];
        _titleLabel.layer.masksToBounds = YES;
    }
    return _titleLabel;
}

- (void)configCellWithModel:(typeModel *)model
{
    [self.contentView addSubview:self.imageView];
    
    [self.contentView addSubview:self.titleLabel];
    
    if (model.clipedImage) {

        self.imageView.layer.contents = (__bridge id _Nullable)(model.clipedImage.CGImage);
    }else{
        
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage *image = [UIImage imageNamed:model.imageName];
        image = [self clipImage:image toSize:self.imageView.frame.size];
        dispatch_async(dispatch_get_main_queue(), ^{
            model.clipedImage = image;
            self.imageView.layer.contents = (__bridge id _Nullable)(model.clipedImage.CGImage);
        });
    });
    }
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

@end
