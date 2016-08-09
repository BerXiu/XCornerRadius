//
//  ViewController.m
//  XCornerRadius
//
//  Created by Xiu on 16/8/5.
//  Copyright © 2016年 Xiu. All rights reserved.
//

#import "ViewController.h"
#import "ImageView+Extend.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat centerX = self.view.frame.size.width / 2;
    CGFloat centerY = (self.view.frame.size.height - 64) / 2;
    
    UIImageView *roundingImage = [[UIImageView alloc]initWithRoundingRectImageView];
    roundingImage.image = [UIImage imageNamed:@"textImage"];
    [roundingImage x_setBorderWidth:5 borderColor:[UIColor orangeColor]];
    [roundingImage setFrame:CGRectMake(centerX - 120, centerY - 120, 100, 100)];
    [self.view addSubview:roundingImage];
    
    UIImageView *roundingImage1 = [[UIImageView alloc]init];
    [roundingImage1 x_roundingRectImageView];
    roundingImage1.image = [UIImage imageNamed:@"textImage"];
    [roundingImage1 setFrame:CGRectMake(centerX + 20, centerY - 120, 100, 100)];
    [self.view addSubview:roundingImage1];
    
    UIImageView *cornerRadius = [[UIImageView alloc]initCornerRadius:25 type: UIRectCornerTopLeft | UIRectCornerBottomRight];
    cornerRadius.image = [UIImage imageNamed:@"textImage"];
    [cornerRadius x_setBorderWidth:5 borderColor:[UIColor orangeColor]];
    [cornerRadius setFrame:CGRectMake(centerX - 120, centerY + 20, 100, 100)];
    [self.view addSubview:cornerRadius];
    
    UIImageView *cornerRadius1 = [[UIImageView alloc]initCornerRadius:25 type: UIRectCornerTopRight | UIRectCornerBottomLeft];
    cornerRadius1.image = [UIImage imageNamed:@"textImage"];
    [cornerRadius1 setFrame:CGRectMake(centerX + 20, centerY + 20, 100, 100)];
    [self.view addSubview:cornerRadius1];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
