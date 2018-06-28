//
//  LJMyLotteryViewController.m
//  彩票
//
//  Created by LJ on 2018/1/17.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "LJMyLotteryViewController.h"

@interface LJMyLotteryViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LJMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *customButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [customButton setImage:[UIImage imageWithOriginalRenderImage:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    [customButton setTitle:@"客服" forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customButton];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalRenderImage:@"Mylottery_config"] style:0 target:self action:@selector(setAction)];
    
    UIImage *originalImage = [UIImage imageNamed:@"RedButton"];
    UIImage *newImage = [originalImage resizableImageWithCapInsets:UIEdgeInsetsMake(originalImage.size.height *0.5, originalImage.size.width * 0.5, originalImage.size.height *0.5, originalImage.size.width * 0.5) resizingMode:UIImageResizingModeStretch];
    [self.loginButton setBackgroundImage:newImage forState:UIControlStateNormal];
    
}

- (void)setAction {
    NSLog(@".......");
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
