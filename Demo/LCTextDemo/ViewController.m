//
//  ViewController.m
//  LCModalHelperDemo
//
//  Created by menglingchao on 2018/1/13.
//  Copyright © 2018年 mengLingChao. All rights reserved.
//

#import "ViewController.h"
#import "LCATableViewCell.h"
#import "LCBTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy) NSArray *classNames;//

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
#pragma mark - Getter
- (NSArray *)classNames {
    if (! _classNames) {
        _classNames = @[@"LCATableViewCell",@"LCBTableViewCell"];
    }
    return _classNames;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.classNames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @(indexPath.row).stringValue;
    NSString *className = self.classNames[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        Class class = NSClassFromString(className);
        cell = [[class alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellID];
    }
    
    return cell;
}

@end
