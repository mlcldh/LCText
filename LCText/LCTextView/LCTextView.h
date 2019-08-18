//
//  LCTextView.h
//  LCText
//
//  Created by menglingchao on 2019/8/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**有占位符placeholder的TextView*/
@interface LCTextView : UITextView

/**占位符*/
@property (nonatomic,copy) NSString *placeholder;
/**占位符富文本*/
@property (nonatomic,copy) NSAttributedString *attributedPlaceholder;
/**占位符颜色*/
@property (nonatomic,strong) UIColor *placeholderTextColor;
/**占位符左边边距，默认是5*/
@property (nonatomic) CGFloat placeholderLeftMargin;
/**占位符顶部边距，默认是8*/
@property (nonatomic) CGFloat placeholderTopMargin;

@end

NS_ASSUME_NONNULL_END
