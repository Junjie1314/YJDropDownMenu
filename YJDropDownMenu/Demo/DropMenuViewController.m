//
//  DropMenuViewController.m
//  YJDropDownMenu
//
//  Created by iOS on 16/4/8.
//  Copyright © 2016年 Junjie. All rights reserved.
//

#import "DropMenuViewController.h"

@implementation DropMenuViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSArray *arr            = @[@"star",@"fork",@"guess"];
    static NSString *cellID = @"dropCell";
    
    UITableViewCell *cell   = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
    cell                    = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    cell.detailTextLabel.text     = arr[indexPath.row];
    cell.detailTextLabel.font     = [UIFont systemFontOfSize:18];

    return cell;
}

@end
