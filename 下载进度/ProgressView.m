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
    
    NSArray *dataArr = @[@14,@16,@20,@30,@20];
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startAngle = 0;
    CGFloat endAngle = 0;
    CGFloat angle = 0;
    for (NSNumber *num in dataArr) {
        startAngle = endAngle;
        angle = num.floatValue / 100.0 * M_PI * 2;
        endAngle = startAngle + angle;
        UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:true];
        // 添加一根线到圆心
        [path addLineToPoint:center];
        [[self randomColor] set];
        [path fill];
    }
    
    
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
     
     CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
     CGFloat radius = rect.size.width * 0.5 - 10;
     CGFloat startAngle = -M_PI_2;
     CGFloat angle = self.progressValue * (M_PI * 2);
     CGFloat endAngle = startAngle + angle;
     UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:true];
     [path stroke];
     */
}

// 生成一个随机色
- (UIColor *)randomColor{
    
    CGFloat red = arc4random_uniform(256) / 255.0;
    CGFloat green = arc4random_uniform(256) / 255.0;
    CGFloat blue = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

// 点击改变颜色
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //重绘
    [self setNeedsDisplay];
}


@end
