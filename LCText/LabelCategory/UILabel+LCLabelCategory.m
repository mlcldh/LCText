//
//  UILabel+LCLabelCategory.m
//  MengTextKit
//
//  Created by menglingchao on 2018/1/19.
//  Copyright © 2018年 mengLingChao. All rights reserved.
//

#import "UILabel+LCLabelCategory.h"
#import "LCTextSelectedHelper.h"
#import <objc/runtime.h>

#define LCWeak(obj) __weak typeof(obj) weak##obj = obj;
#define LCStrong(obj) __strong typeof(obj) obj = weak##obj;

NSString const *LC_TapBlock = @"LC_TapBlock";
NSString const *LC_TextHelper = @"LC_TextHelper";

@interface UILabel ()

@property (nonatomic,strong) LCTextSelectedHelper *lc_textHelper;

@end

@implementation UILabel (LCLabelCategory)

- (void)setLc_tapBlock:(void (^)(NSInteger, NSAttributedString *))lc_tapBlock {
    objc_setAssociatedObject(self, &LC_TapBlock, lc_tapBlock, OBJC_ASSOCIATION_COPY);
    self.userInteractionEnabled = YES;
    LCTextSelectedHelper *textHelper = [[LCTextSelectedHelper alloc]init];
    self.lc_textHelper = textHelper;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lc_tapAction:)];
    [self addGestureRecognizer:tapGestureRecognizer];
}
- (void (^)(NSInteger, NSAttributedString *))lc_tapBlock {
    return objc_getAssociatedObject(self, &LC_TapBlock);
}
- (void)setLc_textHelper:(LCTextSelectedHelper *)lc_textHelper {
    objc_setAssociatedObject(self, &LC_TextHelper, lc_textHelper, OBJC_ASSOCIATION_RETAIN);
}
- (LCTextSelectedHelper *)lc_textHelper {
    return objc_getAssociatedObject(self, &LC_TextHelper);
}
#pragma mark -Event
- (void)lc_tapAction:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:recognizer.view];
//    NSLog(@"location = %@",NSStringFromCGPoint(location));
    LCWeak(self);
    [self.lc_textHelper selectLocation:location ofLabel:(UILabel *)recognizer.view selectedBlock:^(NSInteger index, NSAttributedString *charAttributedString) {
        LCStrong(self)
        if (self.lc_tapBlock) {
            self.lc_tapBlock(index,charAttributedString);
        }
    }];
}


@end
