//
//  LJPopMenu.m
//  彩票
//
//  Created by LJ on 2018/1/24.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "LJPopMenu.h"

@implementation LJPopMenu

+ (instancetype)showPopMenuInPosition:(CGPoint)position {
    LJPopMenu *popMenu = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    [LJKeyWindow addSubview:popMenu];
    popMenu.center = position;
    return popMenu;
}

- (void)hidePopMenuIncenter:(CGPoint)center complete:(void (^)(void))comp {
    [UIView animateWithDuration:0.2 animations:^{
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.center = center;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if (comp) {
            comp();
        }
    }];
}

- (IBAction)close:(id)sender {
    if (self.closeBlock) {
        self.closeBlock();
    }
}

@end
