//
//  YJDropDownMenu.m
//  YJDropDownMenu
//
//  Created by iOS on 16/4/8.
//  Copyright © 2016年 Junjie. All rights reserved.
//

#import "YJDropDownMenu.h"
#import "UIView+Extension.h"
#define DropViewW   [UIScreen mainScreen].bounds.size.width*100/320.0
#define DropViewH   [UIScreen mainScreen].bounds.size.height*210/480.0

@interface YJDropDownMenu ()

@property (nonatomic, strong) UIImageView *containerView;

@end

@implementation YJDropDownMenu

//懒加载
- (UIView *)containerView {
    
    if (!_containerView) {
        // 添加一个灰色图片控件
        UIImageView *containerView           = [[UIImageView alloc] init];
        containerView.width                  = 100;
        containerView.height                 = 200;
        containerView.image                  = [UIImage imageNamed:@"popover_background"];
        containerView.userInteractionEnabled = YES;// 开启交互
        [self addSubview:containerView];
        self.containerView                   = containerView;
    }
    return _containerView;
}

- (id)initWithFrame:(CGRect)frame {
    
    frame.origin.y       = 64;
    self                 = [super initWithFrame:frame];
    if (self) {
        //清除颜色
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    }
    return self;
}

+ (instancetype)menu {
    
    return [[self alloc] init];
}

- (void)setContent:(UIView *)content {
    _content                  = content;
    content.x                 = 10;
    content.y                 = 15;

    // 设置灰色的高度
    self.containerView.height = CGRectGetMaxY(content.frame) + 11;
    // 设置灰色的宽度
    self.containerView.width  = CGRectGetMaxX(content.frame) + 10;

    [self.containerView addSubview:content];
}

- (void)setContentController:(UIViewController *)contentController {
    
    _contentController = contentController;
    self.content       = contentController.view;
}

- (void)showFrom:(UIView *)view {
    
    UIWindow *window           = [[UIApplication sharedApplication].windows lastObject];
    CGRect frame               = window.bounds;
    frame.origin.y             = 64;
    self.frame                 = frame;
    //调整灰色图片的位置
    //默认情况下,frame是以父控件左上角为坐标原点
    //转换坐标系
    // 将rect由rect所在视图转换到目标视图view中，返回在目标视图view中的rect
    CGRect newFrame            = [view convertRect:view.bounds toView:window];
    self.containerView.centerX = CGRectGetMidX(newFrame);
    self.containerView.y       = CGRectGetMaxY(newFrame) - 64;

    [window addSubview:self];
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDidShow:)]) {
        [self.delegate dropdownMenuDidShow:self];
    }
}

- (void)showWithCoverNaviFrom:(UIView *)view {
    
    UIWindow *window           = [[UIApplication sharedApplication].windows lastObject];
    self.frame                 = window.bounds;

    CGRect newFrame            = [view convertRect:view.bounds toView:window];
    self.containerView.centerX = CGRectGetMidX(newFrame);
    self.containerView.y       = CGRectGetMaxY(newFrame);
    [window addSubview:self];
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDidShow:)]) {
        [self.delegate dropdownMenuDidShow:self];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismiss];
}

- (void)dismiss {
    
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDidDismiss:)]) {
        [self.delegate dropdownMenuDidDismiss:self];
    }
}

- (void)dismissWithoutAnimations {
    
    self.alpha = 0;
    [self removeFromSuperview];
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDidDismiss:)]) {
        [self.delegate dropdownMenuDidDismiss:self];
    }
}

@end

