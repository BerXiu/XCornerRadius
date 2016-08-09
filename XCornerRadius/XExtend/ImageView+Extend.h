//
//  ImageView+Extend.h
//  XCornerRadius
//
//  Created by Xiu on 16/8/5.
//  Copyright © 2016年 Xiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIImageView (ImageView_Extend)


- (instancetype)initWithRoundingRectImageView;

- (void)x_roundingRectImageView;

- (instancetype)initCornerRadius:(CGFloat)cornerRadius type:(UIRectCorner)type;

- (void)x_cornerRadius:(CGFloat)cornerRadius type:(UIRectCorner)type;

- (void)x_setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end
