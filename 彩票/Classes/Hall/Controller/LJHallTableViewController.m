//
//  LJHallTableViewController.m
//  彩票
//
//  Created by LJ on 2018/1/17.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "LJHallTableViewController.h"
#import "LJCoverView.h"
#import "LJPopMenu.h"

@interface LJHallTableViewController ()

@property (nonatomic,strong)LJPopMenu *popMenu;

@end

@implementation LJHallTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalRenderImage:@"CS50_activity_image"] style:0 target:self action:@selector(leftBarButtonItemClicked)];
}

- (void)leftBarButtonItemClicked {
    [LJCoverView show];
    LJPopMenu * popMenu = [LJPopMenu showPopMenuInPosition:self.view.center];
    self.popMenu = popMenu;
    LJWeakSelf(weakSelf)
    popMenu.closeBlock = ^{
        [weakSelf.popMenu hidePopMenuIncenter:CGPointMake(44, 44) complete:^{
            [LJCoverView hide];
        }];
    };
}

@end
