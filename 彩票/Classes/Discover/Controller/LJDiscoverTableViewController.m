//
//  LJDiscoverTableViewController.m
//  彩票
//
//  Created by LJ on 2018/1/17.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "LJDiscoverTableViewController.h"

@interface LJDiscoverTableViewController ()

@end

@implementation LJDiscoverTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.transform = CGAffineTransformMakeTranslation(self.view.frame.size.width, 0);
    [UIView animateWithDuration:0.5 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

@end
