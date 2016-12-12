//
//  UIButton+Reset.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/12.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "UIButton+Reset.h"

@implementation UIButton (Reset)

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = (contentRect.size.height*3)/4;
    CGFloat imageX = 0;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = (contentRect.size.height*3)/4;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = (contentRect.size.height)/4;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

@end
