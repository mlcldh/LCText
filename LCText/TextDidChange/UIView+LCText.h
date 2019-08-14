//
//  UIView+LCText.h
//  LCText
//
//  Created by mengLingChao on 2019/8/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LCText)

/**文字改变回调，现在仅适用于UITextField或UITextView*/
@property (nonatomic, copy) void(^lc_textDidChangeBlock)(NSString *text);

@end

NS_ASSUME_NONNULL_END
