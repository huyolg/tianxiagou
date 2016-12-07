//
//  CollectionViewCell.m
//  lunbo
//
//  Created by 胡永亮 on 16/9/6.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell ()

@property (nonatomic,strong) UIImageView *imgView;

@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imgView = [[UIImageView alloc] initWithFrame:self.bounds];
//        self.imgView.layer.cornerRadius = 12;
//        self.imgView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.imgView];
        
        
    }
    
    return self;
}

//- (void)setUrl:(NSURL *)url
//{
//    _url = url;
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    UIImage *image = [UIImage imageWithData:data];
//    self.imgView.image = image;
//}

- (void)configWithImage:(id)image {
//    self.imgView.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:image].CGImage);
    NSLog(@"image %@",image);
    self.imgView.image = [UIImage imageNamed:image];
}

@end
