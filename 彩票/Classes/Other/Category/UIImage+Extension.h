//
//  UIImage+ColorToImage.h
//  彩票
//
//  Created by LJ on 2018/1/23.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  @brief  根据颜色生成纯色图片
 *
 *  @param color 颜色
 *
 *  @return 纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


/**
 返回未经渲染的图片

 @param imageName 图片名称
 @return 返回未经渲染的图片
 */
+ (UIImage *)imageWithOriginalRenderImage:(NSString *)imageName;

@end
