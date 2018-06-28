//
//  LJTabBar.m
//  彩票
//
//  Created by LJ on 2018/1/18.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "LJTabBar.h"
#import "LJTabBarButton.h"

@interface LJTabBar ()

@property (nonatomic, strong)UIButton *selectedButton;

@end

@implementation LJTabBar

- (void)setTabBarItems:(NSArray *)tabBarItems {
    _tabBarItems = tabBarItems;
    for (int i = 0; i < tabBarItems.count; i++) {
        LJTabBarButton *tabBarButton = [LJTabBarButton buttonWithType:UIButtonTypeCustom];
        UITabBarItem *item = tabBarItems[i];
        UIImage *image = item.image;
        UIImage *selectedImage = item.selectedImage;
        [tabBarButton setBackgroundImage:image forState:UIControlStateNormal];
        [tabBarButton setBackgroundImage:selectedImage forState:UIControlStateSelected];
        [tabBarButton addTarget:self action:@selector(tabBarButtonTouchDown:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:tabBarButton];
        if (i == 0) {
            [self tabBarButtonTouchDown:tabBarButton];
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.frame.size.width / self.tabBarItems.count;
    CGFloat height = self.frame.size.height;
    int i = 0;
    for (UIButton *button in self.subviews) {
        x = width * i;
        button.tag = i;
        button.frame = CGRectMake(x, y, width, height);
        i++;
    }
}

- (void)tabBarButtonTouchDown:(LJTabBarButton *)sender {
    self.selectedButton.selected = NO;
    sender.selected = YES;
    self.selectedButton = sender;
    if (self.selected) {
        self.selected(sender.tag);
    }
}

@end

