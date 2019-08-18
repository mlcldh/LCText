//
//  LCDTableViewCell.m
//  LCTextDemo
//
//  Created by xmly on 2019/8/16.
//  Copyright © 2019 mengLingChao. All rights reserved.
//

#import "LCDTableViewCell.h"
#import "LCTextView.h"
#import "UIView+LCText.h"
#import "Masonry.h"

@interface LCDTableViewCell ()

@property (nonatomic,strong) LCTextView *textView;//

@end

@implementation LCDTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self textView];
    }
    return self;
}
#pragma mark - Getter
- (LCTextView *)textView {
    if (!_textView) {
        _textView = [[LCTextView alloc]init];
        _textView.backgroundColor = [UIColor lightGrayColor];
        _textView.placeholder = @"Please input";
        _textView.font = [UIFont systemFontOfSize:20];
//        _textView.placeholderTextColor = [UIColor redColor];
        [_textView setLc_textDidChangeBlock:^(NSString * _Nonnull text) {
            NSLog(@"LCTextView同样支持textDidChange text = %@",text);
        }];
        [self.contentView addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
        }];
    }
    return _textView;
}

@end
