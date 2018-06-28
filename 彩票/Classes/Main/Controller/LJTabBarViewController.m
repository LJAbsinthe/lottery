//
//  LJTabBarViewController.m
//  彩票
//
//  Created by LJ on 2018/1/17.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "LJTabBarViewController.h"
#import "LJHallTableViewController.h"
#import "LJArenaViewController.h"
#import "LJDiscoverTableViewController.h"
#import "LJHistoryTableViewController.h"
#import "LJMyLotteryViewController.h"
#import "LJTabBar.h"
#import "LJNavigationController.h"
#import "LJArenaNavigationController.h"

@interface LJTabBarViewController ()

@property (nonatomic, strong)NSMutableArray * tabBarItems;

@end

@implementation LJTabBarViewController

- (NSMutableArray *)tabBarItems {
    if (!_tabBarItems) {
        _tabBarItems = [NSMutableArray array];
    }
    return _tabBarItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildViewControllers];
    [self setTabBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    for (UIView *view in self.tabBar.subviews) {
        if (![view isKindOfClass:[LJTabBar class]]) {
            view.hidden = YES;
        }
    }
}

- (void)setUpChildViewControllers {
    
    //购彩大厅
    LJHallTableViewController *hallTabVc = [[LJHallTableViewController alloc]init];
    [self setOneChildVcWithViewController:hallTabVc andImage:[UIImage imageNamed:@"TabBar_Hall_new"] selectedImage:[UIImage imageNamed:@"TabBar_Hall_selected_new"]title:@"购彩大厅"];
    
    //竞技场
    LJArenaViewController *areanVC = [[LJArenaViewController alloc] init];
    areanVC.view.backgroundColor = [UIColor whiteColor];
    [self setOneChildVcWithViewController:areanVC andImage:[UIImage imageNamed:@"TabBar_Arena_new"] selectedImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"]title:nil];
    
    //发现
    LJDiscoverTableViewController *discoverVC = [[UIStoryboard storyboardWithName:NSStringFromClass([LJDiscoverTableViewController class]) bundle:nil] instantiateInitialViewController];
    [self setOneChildVcWithViewController:discoverVC andImage:[UIImage imageNamed:@"TabBar_Discovery_new"] selectedImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"]title:@"发现"];
    
    //开奖信息
    LJHistoryTableViewController *historyVC = [[LJHistoryTableViewController alloc] init];
    historyVC.view.backgroundColor = [UIColor purpleColor];
    [self setOneChildVcWithViewController:historyVC andImage:[UIImage imageNamed:@"TabBar_History_new"] selectedImage:[UIImage imageNamed:@"TabBar_History_selected_new"]title:@"开奖信息"];
    
    //我的彩票
    LJMyLotteryViewController *mylotteryVC = [[LJMyLotteryViewController alloc]init];
    [self setOneChildVcWithViewController:mylotteryVC andImage:[UIImage imageNamed:@"TabBar_MyLottery_new"] selectedImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"]title:@"我的彩票"];
}

- (void)setOneChildVcWithViewController:(UIViewController *)Vc andImage:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title{
    UINavigationController *myNavigationController = [[LJNavigationController alloc]initWithRootViewController:Vc];
    if ([Vc isKindOfClass:[LJArenaViewController class]]) {
        myNavigationController = [[LJArenaNavigationController alloc]initWithRootViewController:Vc];
    }
    [self addChildViewController:myNavigationController];
    Vc.navigationItem.title = title;
    Vc.tabBarItem.image = image;
    Vc.tabBarItem.selectedImage = selectedImage;
    [self.tabBarItems addObject:Vc.tabBarItem];
}

- (void)setTabBar {
    LJTabBar *myTabBar = [[LJTabBar alloc] init];
    myTabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:myTabBar];
    myTabBar.tabBarItems = self.tabBarItems;
    __weak typeof (self) weakSelf = self;
    myTabBar.selected = ^(NSInteger idx) {
        weakSelf.selectedIndex = idx;
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
