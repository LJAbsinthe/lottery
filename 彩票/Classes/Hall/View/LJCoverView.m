//
//  LJCoverView.m
//  彩票
//
//  Created by LJ on 2018/1/24.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "LJCoverView.h"

@implementation LJCoverView

+ (void)show {
    LJCoverView *coverView = [[self alloc]init];
    coverView.frame = [UIScreen mainScreen].bounds;
    coverView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    [LJKeyWindow addSubview:coverView];
}

+ (void)hide {
    for (UIView *view in LJKeyWindow.subviews) {
        if ([view isKindOfClass:[LJCoverView class]]) {
            [view removeFromSuperview];
            break;
        }
    }
}

@end
