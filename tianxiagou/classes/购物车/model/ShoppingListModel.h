//
//  ShoppingListModel.h
//  tianxiagou
//
//  Created by 胡永亮 on 2016/12/8.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShoppingListModel : NSObject

@property (nonatomic,strong) NSString *imageName;

@property (nonatomic,strong) NSString *nameTitle;

@property (nonatomic,strong) NSString *nowPrice;

@property (nonatomic,strong) NSString *oldPrice;

@property (nonatomic,strong) NSString *introStr;

@property (nonatomic, strong) UIImage *clipedImage;

@end
