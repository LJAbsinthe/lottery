//
//  LJTitleViewButton.m
//  彩票
//  封装标题在左侧，图片在右侧按钮
//  Created by LJ on 2018/2/1.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "LJTitleViewButton.h"

@implementation LJTitleViewButton

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.titleLabel.frame.origin.x > self.imageView.frame.origin.x) {
        self.titleLabel.frame = CGRectMake(CGRectGetMinX(self.imageView.frame), CGRectGetMinY(self.imageView.frame), self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
        self.imageView.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame), CGRectGetMinY(self.imageView.frame), self.imageView.frame.size.width, self.imageView.frame.size.height);
    }
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    [self sizeToFit];
}
@end
