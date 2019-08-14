//
//  UIView+LCText.m
//  LCText
//
//  Created by mengLingChao on 2019/8/13.
//

#import "UIView+LCText.h"
#import "LCTextDidChangeHelper.h"
#import <objc/runtime.h>

#define LCWeak(obj) __weak typeof(obj) weak##obj = obj;
#define LCStrong(obj) __strong typeof(obj) obj = weak##obj;

@interface UIView ()

@property (nonatomic, strong) LCTextDidChangeHelper *lc_textDidChangeHelper;//

@end

@implementation UIView (LCText)

- (void (^)(NSString * _Nonnull))lc_textDidChangeBlock {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLc_textDidChangeBlock:(void (^)(NSString * _Nonnull))lc_textDidChangeBlock {
    objc_setAssociatedObject(self, @selector(lc_textDidChangeBlock), lc_textDidChangeBlock, OBJC_ASSOCIATION_RETAIN);
    if (!self.lc_textDidChangeHelper) {
        self.lc_textDidChangeHelper = [[LCTextDidChangeHelper alloc]initWithView:self];
        LCWeak(self)
        [self.lc_textDidChangeHelper setTextDidChangeBlock:^(NSString * _Nonnull text) {
            LCStrong(self)
            if (self.lc_textDidChangeBlock) {
                self.lc_textDidChangeBlock(text);
            }
        }];
    }
}
- (LCTextDidChangeHelper *)lc_textDidChangeHelper {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setLc_textDidChangeHelper:(LCTextDidChangeHelper *)lc_textDidChangeHelper {
    objc_setAssociatedObject(self, @selector(lc_textDidChangeHelper), lc_textDidChangeHelper, OBJC_ASSOCIATION_RETAIN);
}

@end
