//
//  UIView+HYLExtension.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/26.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "UIView+HYLExtension.h"

@implementation UIView (HYLExtension)

- (CGFloat)hyl_height
{
    return self.frame.size.height;
}

- (void)setHyl_height:(CGFloat)hyl_height
{
    CGRect temp = self.frame;
    temp.size.height = hyl_height;
    self.frame = temp;
}

- (CGFloat)hyl_width
{
    return self.frame.size.width;
}

- (void)setHyl_width:(CGFloat)hyl_width
{
    CGRect temp = self.frame;
    temp.size.width = hyl_width;
    self.frame = temp;
}

- (CGFloat)hyl_y
{
    return self.frame.origin.y;
}

- (void)setHyl_y:(CGFloat)hyl_y
{
    CGRect temp = self.frame;
    temp.origin.y = hyl_y;
    self.frame = temp;
}

- (CGFloat)hyl_x
{
    return self.frame.origin.x;
}

- (void)setHyl_x:(CGFloat)hyl_x
{
    CGRect temp = self.frame;
    temp.origin.x = hyl_x;
    self.frame = temp;
}

@end
