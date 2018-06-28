//
//  LJNavigationController.m
//  彩票
//
//  Created by LJ on 2018/1/23.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "LJNavigationController.h"
#import "UIImage+Extension.h"
#import <objc/runtime.h>

@interface LJNavigationController ()<UINavigationControllerDelegate>
@property (nonatomic, strong) id popGesDelegate;
@end

@implementation LJNavigationController

+ (void)initialize {
    UINavigationBar *myBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    //设置导航条的背景色方法一
    [myBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:185/255.0 green:29/255.0 blue:49/255.0 alpha:0.9]] forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary *attrDic = [NSMutableDictionary dictionary];
    attrDic[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrDic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:22.0f];
    //设置导航条的背景色方法二
//    myBar.barTintColor =  [UIColor colorWithRed:185/255.0 green:29/255.0 blue:49/255.0 alpha:1];
    [myBar setTitleTextAttributes:attrDic];
    
    //统一设置返回按钮方法二
//    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[self]];
//    [item setTintColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    <UIScreenEdgePanGestureRecognizer: 0x7ff934361e20; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7ff93257ace0>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7ff934361390>)>>

    self.popGesDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
    UIScreenEdgePanGestureRecognizer *gest =(UIScreenEdgePanGestureRecognizer *) self.interactivePopGestureRecognizer;
    
    // 缺Target 系统的私有属性
    // KVC [gest valueForKeyPath:@""];
    // 不知道 Target 真实类型
    // oc  runtime 机制 只能动态获取当前类的成员属性,不能获取其子类,或者父类的属性
    // __unsafe_unretained Class  要获取哪个类的成员属性
    // unsigned int *outCount  获取Class 下面的所有成员属性的个数
    //    unsigned int outCount = 0;
    //
    //   Ivar *ivars =  class_copyIvarList([UIGestureRecognizer class], &outCount);
    //    for (int i = 0; i<outCount; i++) {
    ////        ivars[i];
    //        // 获取成员属性的名字
    //     NSString *name = @(ivar_getName(ivars[i]));
    //        NSLog(@"%@",name);
    //
    //    }
    // (action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7fd9db250ce0>)
    
    // _targets
    unsigned int count = 0;
    Ivar *ivar = class_copyIvarList([UIGestureRecognizer class], &count);
    for (int i = 0; i < count; i ++) {
        NSString *name =@(ivar_getName(ivar[i]));
        NSLog(@"++++++++%@",name);
    }
    NSArray *targets =  [gest valueForKeyPath:@"_targets"];
    id target =  [targets[0] valueForKeyPath:@"_target"];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target  action:@selector(handleNavigationTransition:)];
    
    [self.view addGestureRecognizer:pan];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    if (self.viewControllers.count > 1) {
        //统一设置返回按钮 方法一
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalRenderImage:@"NavBack"] style:0 target:self action:@selector(back)];
    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (navigationController.childViewControllers.count >1) {
        self.interactivePopGestureRecognizer.delegate = nil;
    }else {
        self.interactivePopGestureRecognizer.delegate = self.popGesDelegate;
    }
}

- (void)back {
    [self popViewControllerAnimated:YES];
}
@end
