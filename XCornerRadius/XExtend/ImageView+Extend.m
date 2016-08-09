//
//  ImageView+Extend.m
//  XCornerRadius
//
//  Created by Xiu on 16/8/5.
//  Copyright © 2016年 Xiu. All rights reserved.
//

#import "ImageView+Extend.h"
#import <objc/runtime.h>

@interface UIImageView()

/// 边线宽
@property (nonatomic, assign) CGFloat       borderWidth;

/// 圆角
@property (nonatomic, assign) CGFloat       cornerRadius;

/// rectCorner
@property (nonatomic, assign) UIRectCorner  type;

/// 边线颜色
@property (nonatomic, strong) UIColor *     borderColor;

@end

@implementation UIImageView (ImageView_Extend)



- (instancetype)initWithRoundingRectImageView{
    self = [super init];
    if (self) {
        [self x_roundingRectImageView];
    }
    return self;
}

- (void)x_roundingRectImageView {
    self.type = UIRectCornerAllCorners;
    [self setup];
}

- (instancetype)initCornerRadius:(CGFloat)cornerRadius type:(UIRectCorner)type {
    self = [super init];
    if (self) {
        [self x_cornerRadius:cornerRadius type:type];
    }
    return self;
}

- (void)x_cornerRadius:(CGFloat)cornerRadius type:(UIRectCorner)type {
    self.cornerRadius = cornerRadius;
    self.type = type;
    [self setup];
}

- (void)x_setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    self.borderWidth = borderWidth;
    self.borderColor = borderColor;
    
    [self cornerRadius:self.cornerRadius ? self.cornerRadius :self.bounds.size.width / 2  type: self.type];
}

- (void)setup {
    [self addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
}


- (void)cornerRadius:(CGFloat)cornerRadius type:(UIRectCorner)type {
    
    
    CGSize size = self.bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize cornerRadii = CGSizeMake(cornerRadius, cornerRadius);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    if (nil == currentContext) {
        return;
    }
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:type cornerRadii:cornerRadii];
    [cornerPath addClip];
    [self.layer renderInContext:currentContext];
    [self drawBorder:cornerPath];
    UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self removeObserver:self forKeyPath:@"image"];
    self.image = processedImage;
    [self addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];

}


#pragma mark - KVO for .image
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"image"] || [keyPath isEqualToString:@"frame"]) {
        [self cornerRadius:self.cornerRadius ? self.cornerRadius: self.bounds.size.width / 2 type:self.type];
    }
}
#pragma mark - Private
- (void)drawBorder:(UIBezierPath *)path {
    if (0 != self.borderWidth && nil != self.borderColor) {
        [path setLineWidth:2 * self.borderWidth];
        [self.borderColor setStroke];
        [path stroke];
    }
}

-(void)dealloc {
    if (self.observationInfo) {
        [self removeObserver:self forKeyPath:@"frame"];
        [self removeObserver:self forKeyPath:@"image"];
    }
}

#pragma mark property
- (CGFloat)borderWidth {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    return objc_setAssociatedObject(self, @selector(borderWidth), @(borderWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)borderColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBorderColor:(UIColor *)borderColor{
    return objc_setAssociatedObject(self, @selector(borderColor), borderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)cornerRadius {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    return objc_setAssociatedObject(self, @selector(cornerRadius), @(cornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIRectCorner)type {
    return [objc_getAssociatedObject(self, _cmd) unsignedIntegerValue];
}

- (void)setType:(UIRectCorner)type {
    return objc_setAssociatedObject(self, @selector(type), @(type), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
