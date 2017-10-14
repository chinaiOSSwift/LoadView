//
//  ViewController.m
//  下载进度
//
//  Created by 万艳勇 on 2017/10/14.
//  Copyright © 2017年 SKOrganization. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet ProgressView *topView;
@property (weak, nonatomic) IBOutlet UILabel *showResultL;




@end

@implementation ViewController



- (IBAction)valueChanged:(UISlider *)sender {
    // 获取进度值
    NSLog(@"%f",sender.value);
    // % 在stringWithFormat 有特殊含义,不能直接使用,如果想使用,用两个代表一个
    self.topView.progressValue = sender.value;
    self.showResultL.text = [NSString stringWithFormat:@"%.2f%%",sender.value * 100];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
