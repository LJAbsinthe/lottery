//
//  LJArenaViewController.m
//  彩票
//
//  Created by LJ on 2018/1/17.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "LJArenaViewController.h"

@interface LJArenaViewController ()

@property (nonatomic, strong)UIView *aView;
@end

@implementation LJArenaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISegmentedControl *segmentC = [[UISegmentedControl alloc]initWithItems: @[@"足球",@"篮球"]];
    self.navigationItem.titleView = segmentC;
    [segmentC setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segmentC setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [segmentC setSelectedSegmentIndex:0];
    [segmentC setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                                        NSFontAttributeName:[UIFont systemFontOfSize:12.0f]
                                       } forState:UIControlStateNormal];
    segmentC.tintColor = [UIColor colorWithRed:0 green:142/255.0 blue:143/255.0 alpha:1];
    
    
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    aView.backgroundColor = [UIColor redColor];
    [self.view addSubview:aView];
    self.aView = aView;
    
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(test)];
    [aView addGestureRecognizer:ges];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self doAnmi];
    });
}

- (void)doAnmi {
    self.aView.layer.transform = CATransform3DTranslate(self.aView.layer.transform, 100, 100, 50);
}


- (void) test {
    NSLog(@"~~~~~~~~~~~~~~~~~~~~~");
}

@end
