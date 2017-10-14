//
//  ProgressView.m
//  下载进度
//
//  Created by 万艳勇 on 2017/10/14.
//  Copyright © 2017年 SKOrganization. All rights reserved.
//

#import "ProgressView.h"

@interface ProgressView()

@end


@implementation ProgressView

- (void)setProgressValue:(CGFloat)progressValue{
    _progressValue = progressValue;
    // 注意:drawRect 如果是手动调用的话,它是不会创建跟View相关的上下文
    // 只有系统调用该方法时,才会创建跟View相关的上下文
    // 重绘(系统会重新走 drawRect)
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect{
    // 画弧
    /*
    // 1. 获取上下文
    CGContextRef ctf = UIGraphicsGetCurrentContext();
    // 2.描述路径
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startAngle = -M_PI_2;
    CGFloat angle = self.progressValue * (M_PI * 2);
    CGFloat endAngle = startAngle + angle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:true];
    // 3.把路径添加到上下文
    CGContextAddPath(ctf, path.CGPath);
    // 4.把上下文的内容渲染到View上
    CGContextStrokePath(ctf);
     */
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startAngle = -M_PI_2;
    CGFloat angle = self.progressValue * (M_PI * 2);
    CGFloat endAngle = startAngle + angle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:true];
    [path stroke];
}




@end
