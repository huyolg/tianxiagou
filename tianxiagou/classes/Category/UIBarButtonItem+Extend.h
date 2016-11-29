//
//  UIBarButtonItem+Extend.h
//  Lexicon
//
//  Created by 胡永亮 on 2016/11/18.
//  Copyright © 2016年 胡永亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extend)

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemWithIcon:(NSString *)imageName target:(id)target action:(SEL)action;

@end
