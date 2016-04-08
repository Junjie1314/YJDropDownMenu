//
//  YJDropDownMenu.h
//  YJDropDownMenu
//
//  Created by iOS on 16/4/8.
//  Copyright © 2016年 Junjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YJDropDownMenu;
@protocol YJDropDownMenuDelegate <NSObject>

- (void)dropdownMenuDidDismiss:(YJDropDownMenu *)menu;
- (void)dropdownMenuDidShow:(YJDropDownMenu *)menu;

@end

@interface YJDropDownMenu : UIView

@property (nonatomic, weak) id<YJDropDownMenuDelegate> delegate;

/**
 *  初始化
 */
+ (instancetype)menu;

/**
 *  显示
 */
- (void)showFrom:(UIView *)view;

/**
 *  显示(遮盖覆盖导航栏)
 *
 */
- (void)showWithCoverNaviFrom:(UIView *)view;

/**
 *  销毁
 */
- (void)dismiss;

/**
 *  销毁无动画
 */
- (void)dismissWithoutAnimations;

/**
 *  显示内容
 */
@property (nonatomic, strong) UIView *content;

/**
 *  显示控制器
 */
@property (nonatomic, strong) UIViewController *contentController;

@end