//
//  Const.h
//  Wrench
//
//  Created by dong on 2017/5/22.
//  Copyright © 2017年 dong. All rights reserved.
//

#import "UIColor+Extension.h"


//  屏幕宽
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
//  屏幕高
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width

#define Color_main     [UIColor colorWithRed:202.0/255 green:51.0/255 blue:54.0/255 alpha:1.0]
#define Color_gray     [UIColor colorWithRed:111.0/255 green:111.0/255 blue:111.0/255 alpha:1.0]
#define Color_maingray [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1.0]
#define border_gray    [UIColor colorWithRed:200.0/255 green:200.0/255 blue:200.0/255 alpha:1.0]
#define sublabel_gray  [UIColor colorWithRed:170.0/255 green:170.0/255 blue:170.0/255 alpha:1.0]
#define conditionScrollH 30
#define userHeadH 50
#define view_width (SCREEN_WIDTH-20*5)/4

#define view_addWith 5
#define arrow_width 40
#define arrow_animation_time 0.7
#define resetView_time 0.3


//首页分类的枚举
typedef enum {
    TopicTypeReco = 1,
    TopicTypePicture = 10,
    TopicTypeVideo = 29,
    TopicTypeSearch = 31
} TopicType;

