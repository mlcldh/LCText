//
//  LCCTableViewCell.m
//  LCTextDemo
//
//  Created by xmly on 2019/8/14.
//  Copyright © 2019 mengLingChao. All rights reserved.
//

#import "LCCTableViewCell.h"
#import "Masonry.h"
#import "UIView+LCText.h"

@interface LCCTableViewCell ()

@property (nonatomic,strong) UITextField *textField;//
@property (nonatomic,strong) UIButton *changeTextFieldTextButton;//
@property (nonatomic,strong) UITextView *textView;//
@property (nonatomic,strong) UIButton *changeTextViewTextButton;//

@end

@implementation LCCTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self textField];
        [self changeTextFieldTextButton];
        [self textView];
        [self changeTextViewTextButton];
    }
    return self;
}
#pragma mark - Getter
- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc]init];
        _textField.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
        _textField.placeholder = @"This is a placeholder.";
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [_textField setLc_textDidChangeBlock:^(NSString * text) {
            NSLog(@"textField textDidChange text = %@",text);
        }];
        [self.contentView addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(20);
        }];
    }
    return _textField;
}
- (UIButton *)changeTextFieldTextButton {
    if (!_changeTextFieldTextButton) {
        _changeTextFieldTextButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_changeTextFieldTextButton setTitle:@"change TextField text" forState:(UIControlStateNormal)];
        [_changeTextFieldTextButton addTarget:self action:@selector(changeTextFieldTextButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.contentView addSubview:_changeTextFieldTextButton];
        [_changeTextFieldTextButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.textField.mas_right);
            make.right.equalTo(self.contentView).offset(-20);
            make.top.bottom.equalTo(self.textField);
        }];
    }
    return _changeTextFieldTextButton;
}
- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc]init];
        _textView.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
        [_textView setLc_textDidChangeBlock:^(NSString * _Nonnull text) {
            NSLog(@"textView textDidChange text = %@",text);
        }];
        [self.contentView addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.textField);
            make.top.equalTo(self.textField.mas_bottom).offset(20);
            make.bottom.equalTo(self.contentView).offset(-20);
        }];
    }
    return _textView;
}
- (UIButton *)changeTextViewTextButton {
    if (!_changeTextViewTextButton) {
        _changeTextViewTextButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_changeTextViewTextButton setTitle:@"change TextView text" forState:(UIControlStateNormal)];
        [_changeTextViewTextButton addTarget:self action:@selector(changeTextViewTextButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.contentView addSubview:_changeTextViewTextButton];
        [_changeTextViewTextButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.textView.mas_right);
            make.right.equalTo(self.contentView).offset(-20);
            make.top.bottom.equalTo(self.textView);
        }];
    }
    return _changeTextViewTextButton;
}
#pragma mark - Event
- (void)changeTextFieldTextButtonAction:(UIButton *)button {
    self.textField.text = [NSString stringWithFormat:@"score:%@",@(arc4random()%99+1)];
}
- (void)changeTextViewTextButtonAction:(UIButton *)button {
    self.textView.text = [NSString stringWithFormat:@"score:%@",@(arc4random()%99+1)];
}

@end
