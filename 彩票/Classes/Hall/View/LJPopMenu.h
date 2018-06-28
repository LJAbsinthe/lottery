//
//  LJPopMenu.h
//  彩票
//
//  Created by LJ on 2018/1/24.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^closeBlock)(void);

@interface LJPopMenu : UIView

@property (nonatomic, copy)closeBlock closeBlock;

+ (instancetype)showPopMenuInPosition:(CGPoint)position;

- (void)hidePopMenuIncenter:(CGPoint)center complete:(void(^)(void))comp;

@end
