# LCText 

LCText已支持CocoaPods

将 cocoapods 更新至最新版本.

在 Podfile 中添加 pod 'LCText'，可根据需要决定是否指定版本号，如pod 'LCText', '0.0.3'。

执行 pod install 或 pod update。

如果想使用LCText的所有特性，导入 "LCText.h"。

## LabelCategory 

使用类目UILabel+LCLabelCategory，能够获取UILabel点击的字符位置和字符。

YYLabel提供了获取点击字符的回调，但是YYLabel继承于UIView，如果使用约束布局YYLabel，YYLabel不支持换行后自动自适应高度。

MLLinkLabel继承于UILabel，没有约束布局的问题，但是获取点击字符的方法调用比较复杂。

而我写的这个UILabel的类目，不需要继承于其他Label，很方便就能获取到点击字符的回调。

想单独使用该属性的话，在 Podfile 中添加pod 'LCText/LabelCategory'，执行 pod install 或 pod update，只需导入 "UILabel+LCLabelCategory.h"。

## TextDidChange

通过使用类目UIView+LCText，能够获取文字改变回调，现在仅适用于UITextField或UITextView。

想单独使用该属性的话，在 Podfile 中添加pod 'LCText/TextDidChange'，执行 pod install 或 pod update，只需导入 "UIView+LCText.h"。

## LCTextView

LCTextView继承于UITextView增加了占位符placeholder，外部可以设置placeholder的内容、字体颜色、富文本、左上边距，依赖上面的TextDidChange。

## 文档

你可以在 [CocoaDocs](http://cocoadocs.org/docsets/YYText/) 查看在线 API 文档，也可以用 [appledoc](https://github.com/tomaz/appledoc) 本地生成文档。

## 系统要求

该项目最低支持 `iOS 6.0` 和 `Xcode 8.0`。

## 许可证

LCText 使用 MIT 许可证，详情见 LICENSE 文件。



我的CSDN博客地址 http://blog.csdn.net/mlcldh
