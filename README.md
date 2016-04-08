# YJDropDownMenu
仿新浪微博下拉菜单

###Example
    //下拉按钮点击
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
    
    #pragma mark - YJDropdownMenuDelegate
    这些回调可修改title按钮视觉状态
    /**
      *     下拉菜单被销毁了
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
###Remind
        附带直接修改view属性分类"UIView+Extension.h"
        // 设置灰色的高度
        self.containerView.height = CGRectGetMaxY(content.frame) + 11;
        // 设置灰色的宽度
        self.containerView.width  = CGRectGetMaxX(content.frame) + 10;
