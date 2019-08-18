//
//  LCTextView.m
//  LCText
//
//  Created by menglingchao on 2019/8/16.
//

#import "LCTextView.h"
#if __has_include(<LCText/LCTextDidChangeHelper.h>)
#import <LCText/LCTextDidChangeHelper.h>
#else
#import "LCTextDidChangeHelper.h"
#endif

#define LCWeak(obj) __weak typeof(obj) weak##obj = obj;
#define LCStrong(obj) __strong typeof(obj) obj = weak##obj;

@interface LCTextView () {
    NSLayoutConstraint *_placeholderLabelLeftConstraint;
    NSLayoutConstraint *_placeholderLabelTopConstraint;
}

@property (nonatomic,strong) UILabel *placeholderLabel;//
@property (nonatomic, strong) LCTextDidChangeHelper *textDidChangeHelper;//

@end

@implementation LCTextView

- (instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer {
    self = [super initWithFrame:frame textContainer:textContainer];
    if (self) {
        [self placeholderLabel];
        [self textDidChangeHelper];
    }
    return self;
}
#pragma mark - Getter
- (UILabel *)placeholderLabel {
    if (!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc]init];
        _placeholderLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_placeholderLabel];
        _placeholderLabelLeftConstraint = [NSLayoutConstraint constraintWithItem:_placeholderLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0];
        _placeholderLabelTopConstraint = [NSLayoutConstraint constraintWithItem:_placeholderLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:0];
        self.placeholderLeftMargin = 5;
        self.placeholderTopMargin = 8;
        _placeholderLabel.translatesAutoresizingMaskIntoConstraints = NO;
        if (@available(iOS 8.0, *)) {
            _placeholderLabelLeftConstraint.active = YES;
            _placeholderLabelTopConstraint.active = YES;
        } else {
            [self addConstraint:_placeholderLabelLeftConstraint];
            [self addConstraint:_placeholderLabelTopConstraint];
        }
    }
    return _placeholderLabel;
}
- (LCTextDidChangeHelper *)textDidChangeHelper {
    if (!_textDidChangeHelper) {
        _textDidChangeHelper = [[LCTextDidChangeHelper alloc]initWithView:self];
        LCWeak(self)
        [_textDidChangeHelper setTextDidChangeBlock:^(NSString * _Nonnull text) {
            LCStrong(self)
            self.placeholderLabel.hidden = self.text.length;
        }];
    }
    return _textDidChangeHelper;
}
#pragma mark - Setter
- (void)setPlaceholder:(NSString *)placeholder {
    if ([placeholder isEqualToString:_placeholder]) {
        return;
    }
    _placeholder = placeholder.copy;
    _attributedPlaceholder = nil;
    self.placeholderLabel.text = _placeholder;
}
- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder {
    if ([attributedPlaceholder isEqualToAttributedString:_attributedPlaceholder]) {
        return;
    }
    _placeholder = nil;
    _attributedPlaceholder = attributedPlaceholder.copy;
    self.placeholderLabel.attributedText = _attributedPlaceholder;
}
- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor {
    if (placeholderTextColor == _placeholderTextColor) {
        return;
    }
    _placeholderTextColor = placeholderTextColor;
    self.placeholderLabel.textColor = placeholderTextColor;
}
- (void)setPlaceholderLeftMargin:(CGFloat)placeholderLeftMargin {
    _placeholderLeftMargin = placeholderLeftMargin;
    _placeholderLabelLeftConstraint.constant = placeholderLeftMargin;
}
- (void)setPlaceholderTopMargin:(CGFloat)placeholderTopMargin {
    _placeholderTopMargin = placeholderTopMargin;
    _placeholderLabelTopConstraint.constant = placeholderTopMargin;
}
- (void)setFont:(UIFont *)font {
    [super setFont:font];
    self.placeholderLabel.font = font;
}

@end
