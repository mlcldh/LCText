//
//  LCTextSelectedHelper.h
//  MengTextKit
//
//  Created by menglingchao on 2018/1/19.
//  Copyright © 2018年 mengLingChao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LCTextSelectedHelper : NSObject

/**
 * 获取UILabel点击的字符
 * @param location 点击label的位置
 * @param label 点击的label
 * @param selectedBlock 点击返回
 */
- (void)selectLocation:(CGPoint)location ofLabel:(UILabel *)label selectedBlock:(void (^)(NSInteger index,NSAttributedString *charAttributedString))selectedBlock;

@end
