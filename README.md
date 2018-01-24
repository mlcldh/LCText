# LCText 提供获取UILabel点击的字符。

YYLabel提供了获取点击字符的回调，但是YYLabel继承于UIView，如果使用约束布局YYLabel，YYLabel不支持换行后自动自适应高度。

MLLinkLabel继承于UILabel，没有约束布局的问题，但是获取点击字符的方法调用比较复杂。

而我写的这个UILabel的类目，不需要继承于其他Label，很方便就能获取到点击字符的回调。

LCText已支持CocoaPods

将 cocoapods 更新至最新版本.

在 Podfile 中添加 pod 'LCText'。

执行 pod install 或 pod update。

导入 "UILabel+LCLabelCategory.h"。

我的CSDN博客地址 http://blog.csdn.net/mlcldh
