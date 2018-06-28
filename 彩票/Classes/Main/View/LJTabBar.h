//
//  LJTabBar.h
//  彩票
//
//  Created by LJ on 2018/1/18.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^selectedBlock)(NSInteger idx);

@interface LJTabBar : UIView

@property (nonatomic, strong)NSArray *tabBarItems;

@property (nonatomic, copy)selectedBlock selected;

@end
