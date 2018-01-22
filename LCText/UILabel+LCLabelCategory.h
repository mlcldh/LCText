//
//  UILabel+LCLabelCategory.h
//  MengTextKit
//
//  Created by menglingchao on 2018/1/19.
//  Copyright © 2018年 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LCLabelCategory)

/**
 * 点击回调
 * @param el_tapBlock index 没有点到时返回-1;charAttributedString 选中的字符的属性字符串
 */
@property (nonatomic,copy) void (^el_tapBlock)(NSInteger index,NSAttributedString *charAttributedString);

@end
