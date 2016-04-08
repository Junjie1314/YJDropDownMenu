//
//  ViewController.m
//  YJDropDownMenu
//
//  Created by iOS on 16/4/8.
//  Copyright © 2016年 Junjie. All rights reserved.
//

#import "ViewController.h"
#import "YJDropDownMenu.h"
#import "DropMenuViewController.h"
#import "UIView+Extension.h"
@interface ViewController () <YJDropDownMenuDelegate>

@property (nonatomic, strong) YJDropDownMenu         *dropMenu;//下拉菜单视图
@property (nonatomic, strong) UIButton               *titleBtn;
@property (nonatomic, strong) DropMenuViewController *menuVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor     = [UIColor whiteColor];
    self.navigationItem.titleView = self.titleBtn;
}

- (UIButton *)titleBtn {
    
    if (!_titleBtn) {
        _titleBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        [_titleBtn setTitle:@"余亦白" forState:UIControlStateNormal];
        [_titleBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_titleBtn addTarget:self action:@selector(titleBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _titleBtn;
}

- (void)titleBtnClicked:(UIButton *)btn {
    
    if (btn.isSelected == NO) {
        self.dropMenu               = [[YJDropDownMenu alloc] init];
        self.dropMenu.delegate      = self;
        _dropMenu.delegate          = self;
        _dropMenu.contentController = self.menuVC;
        [_dropMenu showWithCoverNaviFrom:btn];
    } else {
        [_dropMenu dismiss];
        [self dropdownMenuDidDismiss:_dropMenu];
    }
}

- (DropMenuViewController *)menuVC {

    if (!_menuVC) {
        _menuVC             = [[DropMenuViewController alloc] init];
        _menuVC.view.width  = 100;
        _menuVC.view.height = 150;
    }
    return _menuVC;
}

#pragma mark - YJDropdownMenuDelegate
//这些回调可修改title按钮视觉状态
/**
 *  下拉菜单被销毁了
 */
- (void)dropdownMenuDidDismiss:(YJDropDownMenu *)menu
{
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    titleButton.selected  = NO;
}

/**
 *  下拉菜单显示了
 */
- (void)dropdownMenuDidShow:(YJDropDownMenu *)menu
{
    UIButton *titleButton = (UIButton *)self.navigationItem.titleView;
    titleButton.selected  = YES;
}

@end
