//
//  UIBarButtonItem+Extension.h
//  Wrench
//
//  Created by 董永胜 on 2017/6/1.
//  Copyright © 2017年 dong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage title:(NSString*)title target:(id)target action:(SEL)action;

+ (instancetype)itemWithTitle:(NSString*)title target:(id)target action:(SEL)action;

@end
