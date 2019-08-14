//
//  ViewController.m
//  LCModalHelperDemo
//
//  Created by menglingchao on 2018/1/13.
//  Copyright © 2018年 mengLingChao. All rights reserved.
//

#import "ViewController.h"
#import "LCSecondViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Event
- (IBAction)buttonAction:(UIButton *)sender {// push是为了查看pop后释放有没有问题
    LCSecondViewController *sVC = [[LCSecondViewController alloc]init];
    [self.navigationController pushViewController:sVC animated:YES];
}

@end
