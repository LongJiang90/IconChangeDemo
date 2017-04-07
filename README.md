# IconChangeDemo
iOS 10.3版本新增的应用内切换图标

iOS 10.3新增了应用内更换APP Icon的功能，今天我们就来简单学习一下。
## 官方文档介绍
文档中说你需要在info.plist里面配置好IconsFiles
![](media/14910267211434/14915340568343.jpg)
* Primary Icon：主要图标
    * Icon files：图标数组
    * Icon already includes gloss effects：图标已经包括光泽效果
* CFBundleAlternateIcons：根据Bundle来设置可切换的图标
    * NoImagePlac（Dictionary）：图标字典，以图片名称作为字典名
        * CFBundleIconFiles：Bundle中的Icon文件夹数组（内部包含名称）

[官方文档链接地址](https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html#//apple_ref/doc/uid/TP40009249-SW14)
![](media/14910267211434/14915349142086.png)

## 具体实现
一. 在Assets中为应用设置一个AppIcon <br>
二. 依照上面的Info.plist来配置CFBundleAlternateIcons<br>
    被切换的图标图片必须放在工程里面，放在Assets无效。<br>
三. 使用代码进行切换

    ``` Objective-c
    //判断是否支持切换图标
    if ([UIApplication sharedApplication].supportsAlternateIcons) {
       [[UIApplication sharedApplication] setAlternateIconName:@"Your Icon File Name" completionHandler:^(NSError * _Nullable error) {
           NSLog(@"%@",error);
       }];
    }
    ```
    
这样设置过后将会弹出一个提示框来提示你修改成功。
