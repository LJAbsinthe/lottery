//
//  LJBuyViewController.m
//  彩票
//
//  Created by LJ on 2018/2/1.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "LJBuyViewController.h"
#import "LJTitleViewButton.h"

@interface LJBuyViewController ()

@end

@implementation LJBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    封装标题在左侧，图片在右侧按钮
    LJTitleViewButton *titleButton = [[LJTitleViewButton alloc]init];
    [titleButton setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    [titleButton setTitle:@"全部菜种" forState:UIControlStateNormal];
    self.navigationItem.titleView = titleButton;
    
    UIView *testView = [[UIView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:testView];
    testView.backgroundColor = [UIColor yellowColor];
    
    NSLog(@"%d",self.navigationController.navigationBar.isTranslucent);
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
