# SWFBuilder
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/ibireme/YYKit/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/p/YYKit.svg?style=flat)](http://cocoadocs.org/docsets/YYKit)&nbsp;
[![Build Status](https://travis-ci.org/ibireme/YYKit.svg?branch=master)](https://travis-ci.org/ibireme/YYKit)

</p>

---

原理：主要实现原理的扩展UIKit和Foundation的常用属性和方法，封装成工具类组件，主要特点如下：<br>
<br>`1`链式调用的方式。
<br>`2`标准命名规范。
<br>`3`常用工具方法。
<br>`4`Swift4的最新语法。

</p>
</p>

---

SWFBuilder快速编程组件特点详解
<br>`1`链式调用的方式： 如下以UILabel的构建为例

        Label(makeRect(100, 100, 200, 30))
        .labelFont(fnt(14))
        .labelText("我的内容")
        .labelAlign(NSTextAlignment.center)
        .labelColor(UIColor.red)<br>.viewIntoView(self.view)
            
<br>`2`标准命名规范
        
        UIKit控件初始化时都是以原来控件名称去掉UI开头的名称命名的：如：Label()、Button()、Image()
        Foundation初始化时都是以原来控件名称去掉NS开头的名称命名的：如：Array()、Dictionary()、Data()、Date()
        方法调用时都是以原来控件名称去掉UI/NS开头,第一个字母小写：如：labelFont()、labelAlign()、labelText(),其他控件一样

<br>`3`常用工具方法
封装的工具主要有：<br>

>1) 对话框<br> 

      Alert()
      .setMsg("这里未做任何事")
      .addAction(name: "确定", style: UIAlertActionStyle.default, click: nil)
      .show()

>2) GCD线程

        DoInConcurrent {
            Dlog("子线程并发: \(Thread.current)")
        }
        
        DoInSerial {
            Dlog("子线程串行 \(Thread.current)")
        }
        
        DoInMain {
            Dlog("主线程执行 \(Thread.current)")
        }
        
        DoInMainAfter(3) {
            Dlog("延迟3秒后主线程执行 \(Thread.current)")
        }
>工具类

        颜色生成器
        color("0xffaadd")
        color("ffaadd")
        color("#ffaadd")
        color("random")
        color("ffaadd,0.3")
        
        UIFont生成器
        fnt(14)  //标准字体
        fbt(14)  //粗体
        fit(14)  //斜体
        
        makePoint(1, 1) //构建CGPoint
        makeSize(1, 1) //构建CGSize
        makeRect(1, 1, 1, 1) //构建CGRect
        makeInsets(1, 1, 1, 1) //构建UIEdgeInsets
        makeIndexPath(1, 1) //构建IndexPath
        makeNsIndexPath(1, 1) //构建NSIndexPath
                
        arc4randomTo(100)   //随机数0-100
        arc4random(10, 100) //随机数10-100
        。。。。。。。。。。。。。。。。
>runtime方法
        
        objSwizzlingOrReplaceMethod(originSelector: #selector(originMothed), newSelector: #selector(newMothed)) //方法交换
>富文本等等

<br>`4`Swift4的最新语法
        
        Swift4在Swift3的基础算的上大改动，主要是把繁琐的语法更加简单化


# 安装

###  CocoaPods

        1. 在 `Podfile` 中添加 `pod 'SWFBuilder'`
        2. 执行 `pod install` 或 `pod update`

### 手动安装

        1. 下载`SWFBuilder`文件夹内的所有内容。
        2. 将`SWFBuilder`内的源文件添加(拖放)到你的工程。

