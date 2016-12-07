//
//  typeModel.h
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/6.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface typeModel : NSObject

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *title;

// 剪裁后的图片
@property (nonatomic, strong) UIImage *clipedImage;

@end
