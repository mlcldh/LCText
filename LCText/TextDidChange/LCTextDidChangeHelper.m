//
//  LCTextDidChangeHelper.m
//  LCText
//
//  Created by mengLingChao on 2019/8/13.
//

#import "LCTextDidChangeHelper.h"

@implementation LCTextDidChangeHelper

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [_view removeObserver:self forKeyPath:@"text"];
}
- (instancetype)initWithView:(UIView *)view {
    self = [super init];
    if (self) {
        _view = view;
        if ([_view isKindOfClass:[UITextField class]]) {
            _viewType = LCTextDidChangeHelperViewTypeUITextField;
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hanleUITextFieldTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:_view];
//            [((UITextField *)_view) addTarget:self action:@selector(hanleUITextFieldTextDidChangeNotification:) forControlEvents:(UIControlEventAllEvents)];
        } else if ([_view isKindOfClass:[UITextView class]]) {
            _viewType = LCTextDidChangeHelperViewTypeUITextView;
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hanleUITextViewTextDidChangeNotification:) name:UITextViewTextDidChangeNotification object:_view];
        }
        [_view addObserver:self forKeyPath:@"text" options:(NSKeyValueObservingOptionNew) context:nil];
    }
    return self;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (self.textDidChangeBlock) {
        self.textDidChangeBlock(((UITextField *)_view).text);
    }
}
#pragma mark - UITextFieldTextDidChangeNotification
- (void)hanleUITextFieldTextDidChangeNotification:(NSNotification *)notification {
    if (self.textDidChangeBlock) {
        self.textDidChangeBlock(((UITextField *)_view).text);
    }
}
#pragma mark - UITextViewTextDidChangeNotification
- (void)hanleUITextViewTextDidChangeNotification:(NSNotification *)notification {
    if (self.textDidChangeBlock) {
        self.textDidChangeBlock(((UITextField *)_view).text);
    }
}

@end
