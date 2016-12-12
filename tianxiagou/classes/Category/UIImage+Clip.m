//
//  UIImage+Clip.m
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/12.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import "UIImage+Clip.h"

@implementation UIImage (Clip)

+ (UIImage *)clipImage:(UIImage *)image toSize:(CGSize)size
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
