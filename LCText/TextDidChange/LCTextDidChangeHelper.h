//
//  LCTextDidChangeHelper.h
//  LCText
//
//  Created by mengLingChao on 2019/8/13.
//

#import <Foundation/Foundation.h>

/**view类型枚举*/
typedef NS_ENUM(NSInteger, LCTextDidChangeHelperViewType) {
    LCTextDidChangeHelperViewTypeUITextField = 0,//
    LCTextDidChangeHelperViewTypeUITextView,//
};

NS_ASSUME_NONNULL_BEGIN

@interface LCTextDidChangeHelper : NSObject

/**UITextField或UITextView*/
@property (nonatomic, weak, readonly) UIView *view;
/**UITextField或UITextView*/
@property (nonatomic, readonly) LCTextDidChangeHelperViewType viewType;
/**回调*/
@property (nonatomic, copy) void(^textDidChangeBlock)(NSString *text);
/***/
- (instancetype)initWithView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
