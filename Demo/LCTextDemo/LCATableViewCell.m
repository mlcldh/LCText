//
//  LCATableViewCell.m
//  LCTextDemo
//
//  Created by menglingchao on 2018/1/22.
//  Copyright © 2018年 mengLingChao. All rights reserved.
//

#import "LCATableViewCell.h"
#import "UILabel+LCLabelCategory.h"
#import "Masonry.h"

@interface LCATableViewCell ()

@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation LCATableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self titleLabel];
    }
    return self;
}
#pragma mark - Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.backgroundColor = [UIColor orangeColor];
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _titleLabel.numberOfLines = 0;
        //        _label.text = @"网址http://www.jianshu.com字符串！";
        //        _label.adjustsFontSizeToFitWidth = YES;
        //        _label.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        //        _label.text = @"谷歌啊哈";
        //        _label.text = @"谷歌嗯哼啊哈咋了哥伦比亚";
        //        _label.attributedText = [[NSAttributedString alloc]initWithString:@"属性字符串啊哈汉斯顿" attributes:@{}];
        //        _label.text = @"谷歌啊哈asdfdg";
        //        _label.text = @"谷歌\n啊哈\n咋了哥伦比亚";
        NSMutableAttributedString * attributedText = [[NSMutableAttributedString alloc] initWithString:@"使用约束布局titleLabel！欢迎使用LCText!"];
        //        [attributedText addAttribute:NSLinkAttributeName
        //                        value:@"http://www.jianshu.com"
        //                        range:NSMakeRange(2, attributedText.length -2 -4)];
        [attributedText addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],
                                        NSUnderlineColorAttributeName:[UIColor cyanColor],
                                        NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)
                                        } range:NSMakeRange(2, attributedText.length -2 -4)];
        
        NSTextAttachment *attch = [[NSTextAttachment alloc] init];
        attch.image = [UIImage imageNamed:@"lc_heart_1"];
        CGFloat fontPointSize = _titleLabel.font.pointSize;
        attch.bounds = CGRectMake(0, 0, fontPointSize, fontPointSize);
        //        attch.image = [UIImage sb_imageWithColor:[UIColor colorWithRed:0.9 green:0 blue:0 alpha:0.5] withFrame:CGRectMake(0, 0, 250, 17)];
        // 创建带有图片的富文本
        NSAttributedString *attachmentAttributedString = [NSAttributedString attributedStringWithAttachment:attch];
        [attributedText appendAttributedString:attachmentAttributedString];
        [attributedText appendAttributedString:[[NSAttributedString alloc]initWithString:@"多试试"]];
        _titleLabel.attributedText = attributedText;
        [_titleLabel setEl_tapBlock:^(NSInteger index, NSAttributedString *charAttributedString) {
            NSLog(@"%@,%@,%@",@(index),charAttributedString,charAttributedString.string);
        }];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(10);
            make.width.mas_equalTo(200);
        }];
    }
    return _titleLabel;
}

@end
