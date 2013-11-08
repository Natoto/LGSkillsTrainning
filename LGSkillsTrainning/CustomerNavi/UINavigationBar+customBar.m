//
//  UINavigationBar+customBar.m
//  cuntomNavigationBar
//
//  Created by Edward on 13-4-22.
//  Copyright (c) 2013年 Edward. All rights reserved.
//

#import "UINavigationBar+customBar.h"

//自定义导航栏的风格

@implementation UINavigationBar (customBar)

- (void)customNavigationBar
{
    if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        self.tintColor = [UIColor colorWithRed:0/255.0\
                                        green:60.0/255.0\
                                         blue:132.0/255.0\
                                        alpha:0.5];//[Globle colorFromHexRGB:@"003c7b"];
        //        [self setBackgroundImage:[UIImage imageNamed:@"bg_titlebar"] forBarMetrics:UIBarMetricsDefault];
        
    } else {
        [self drawRect:self.bounds];
    }
    //[self drawRoundCornerAndShadow];
}

-(void)customNavigationBarEx:(NSString *)imgurl
{
    if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        
        [self setBackgroundImage:[UIImage imageNamed:imgurl] forBarMetrics:UIBarMetricsDefault];
    }
    
}



- (void)drawRect:(CGRect)rect
{
//    [[UIImage imageNamed:@"bg_titlebar.png"] drawInRect:rect];
}

- (void)drawRoundCornerAndShadow {
    CGRect bounds = self.bounds;
    bounds.size.height +=10;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                   byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                                         cornerRadii:CGSizeMake(10.0, 10.0)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.path = maskPath.CGPath;
    
    [self.layer addSublayer:maskLayer];
    self.layer.mask = maskLayer;
    self.layer.shadowOffset = CGSizeMake(3, 3);
    self.layer.shadowOpacity = 0.7;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
}
@end
