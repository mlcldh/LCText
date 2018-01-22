//
//  UILabel+LCLabelCategory.m
//  MengTextKit
//
//  Created by menglingchao on 2018/1/19.
//  Copyright © 2018年 Google Inc. All rights reserved.
//

#import "UILabel+LCLabelCategory.h"
#import "LCTextHelper.h"
#import <objc/runtime.h>

NSString const *LC_TapBlock = @"LC_TapBlock";
NSString const *LC_TextHelper = @"LC_TextHelper";

@interface UILabel ()

@property (nonatomic,strong) LCTextHelper *lc_textHelper;

@end

@implementation UILabel (LCLabelCategory)

- (void)setEl_tapBlock:(void (^)(NSInteger, NSAttributedString *))el_tapBlock {
    objc_setAssociatedObject(self, &LC_TapBlock, el_tapBlock, OBJC_ASSOCIATION_COPY);
    self.userInteractionEnabled = YES;
    LCTextHelper *textHelper = [[LCTextHelper alloc]init];
    self.lc_textHelper = textHelper;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(el_tapAction:)];
    [self addGestureRecognizer:tapGestureRecognizer];
}
- (void (^)(NSInteger, NSAttributedString *))el_tapBlock {
    return objc_getAssociatedObject(self, &LC_TapBlock);
}
- (void)setLc_textHelper:(LCTextHelper *)lc_textHelper {
    objc_setAssociatedObject(self, &LC_TextHelper, lc_textHelper, OBJC_ASSOCIATION_RETAIN);
}
- (LCTextHelper *)lc_textHelper {
    return objc_getAssociatedObject(self, &LC_TextHelper);
}
#pragma mark -Event
- (void)el_tapAction:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:recognizer.view];
    NSLog(@"location = %@",NSStringFromCGPoint(location));
    __weak UILabel *weakSelf = self;
    [self.lc_textHelper selectLocation:location OfLabel:(UILabel *)recognizer.view selectedBlock:^(NSInteger index, NSAttributedString *charAttributedString) {
        if (weakSelf.el_tapBlock) {
            weakSelf.el_tapBlock(index,charAttributedString);
        }
    }];
}


@end
