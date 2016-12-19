//
//  UIButton+Reset.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/12.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "UIButton_Reset.h"

@implementation UIButton_Reset

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = (contentRect.size.height)/20;
    CGFloat imageW = contentRect.size.width/2;
    CGFloat imageH = imageW;
    CGFloat imageX = contentRect.size.width/4;
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
