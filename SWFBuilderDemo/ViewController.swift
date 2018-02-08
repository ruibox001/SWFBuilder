//
//  ViewController.swift
//  SWFBuilderDemo
//
//  Created by wsy on 2018/1/31.
//  Copyright © 2018年 liangweifeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addTitle(title:"Swift快速编程组件")
        
        self.addRight(anyObject: "Sheet" as AnyObject, block: { (v: UIView) in
            Sheet().setMsg("这里是详情").setTitle("标题").addAction(name: "确定", style: UIAlertActionStyle.default, click: nil).addAction(name: "取消", style: UIAlertActionStyle.default, click:nil).show()
        })
        
        self.addLeft(anyObject:"Alert" as AnyObject, block: { (v: UIView) in
            Alert().setMsg("这里未做任何事").addAction(name: "确定", style: UIAlertActionStyle.default, click: nil).show()
        })
        
        let yOffset: CGFloat = 15.0
        
        //UILabel
        let label = Label().labelFont(fnt(15))
            .labelColor(color("aaaaaa"))
            .labelText("Swift快速编程组件")
            .labelAlign(NSTextAlignment.center)
            .viewRect(makeRect(10, 80, phoneWidth-20, 20))
            .viewIntoView(self.view)
        
        //UIImage
        let image: UIImage = imageWithName("xxx")!
        
        //UIImageView
        let imgView1 = ImageView(image)
            .viewRect(makeRect((phoneWidth-image.imageSize().width)*0.5, label.bottom()+yOffset, image.imageSize().width, image.imageSize().height))
            .viewIntoView(self.view)
        
        let image2 = image.imageToCircleImage()
        let imgView2 = ImageView(image2)
            .viewRect(makeRect((phoneWidth-image2.imageSize().width)*0.5, imgView1.bottom()+yOffset, image2.imageSize().width, image2.imageSize().height))
            .viewIntoView(self.view)
        
        //UIView
        let ViewLine = View().viewFrame(makeRect(10, imgView2.bottom()+yOffset, phoneWidth-20, 2))
            .viewBgColor(UIColor.orange)
            .viewIntoView(self.view)
        
        
        //分段选项显示
        let items = ["分段1","分段2",UIImage(named:"back")!] as [Any]
         let seg = Segmented(items)
            .segmentedCenter(self.view.center)
            .segmentedtintColor(color("ab1"))
            .segmentedTargetSel(self, #selector(segmentedControlChanged(sender:)), .valueChanged)
            .viewRect(makeRect(100, ViewLine.bottom()+yOffset, phoneWidth-200, 40))
            .viewIntoView(self.view)
        
        let btn = Btn(UIButtonType.custom)
            .btnFont(fnt(14))
            .btnNorTitleColor(color("000"))
            .btnNorTitle("WKWebView")
            .btnAlign(.center)
            .btnClick(self, #selector(clickBtn(sender:)))
            .viewBgColor(color("ccc"))
            .viewFrame(makeRect(100, seg.bottom()+yOffset, phoneWidth-200, 40))
            .viewIntoView(self.view)
        
        let btn1 = Btn(UIButtonType.custom)
            .btnFont(fnt(14))
            .btnNorTitleColor(color("000"))
            .btnNorTitle("圆角按钮")
            .btnAlign(.center)
            .viewBgColor(color("ccc"))
            .viewFrame(makeRect(100, btn.bottom()+yOffset, phoneWidth-200, 40))
            .viewIntoView(self.view)
            .viewCircle(1, 6, UIColor.brown)
        
        //富文本
        let dict = [NSAttributedStringKey.font: fnt(18),NSAttributedStringKey.foregroundColor: UIColor.orange]
        let aStr = AttributedString("我是富文本", attributes: dict)
        let aStr1 = AttributedString("我是正常文本", attributes: [NSAttributedStringKey.font: fnt(14)])
        let mStr = MutableAttributedString(aStr1).mutableAttributedStringAppend(aStr)
        
        let label1 = Label()
            .labelAlign(.center)
            .labelAttriStr(mStr)
            .viewBgColor(UIColor.gray)
            .viewRect(makeRect(10, btn1.bottom()+yOffset, phoneWidth-20, 40))
            .viewIntoView(self.view)
        
        let swt = Switch(makeRect(10, label1.bottom()+yOffset, 0, 0))
            .switchTintColor(UIColor.red)
            .switchOnTintColor(UIColor.blue)
            .switchSetOn(true)
            .setCenterX(self.view.center.x)
            .viewIntoView(self.view)
        
        let textFiled = TextField(makeRect(20, swt.bottom()+yOffset, phoneWidth-40, 35))
            .textFieldFont(fnt(14))
            .textFieldHolder("请输入内容")
            .textFieldTextColor(UIColor.brown)
            .textFieldAlign(.left)
            .textFieldLeftViewOffset(20)
            .textFieldBorderStyle(UITextBorderStyle.roundedRect)
            .viewIntoView(self.view)
            .viewCircle(1, 8, UIColor.gray)
        
        let textFiled1 = TextField(makeRect(20, textFiled.bottom()+yOffset, phoneWidth-40, 35))
            .textFieldFont(fnt(14))
            .textFieldHolder("请输入内容")
            .textFieldTextColor(UIColor.black)
            .textFieldAlign(.left)
            .textFieldBorderStyle(UITextBorderStyle.roundedRect)
            .viewIntoView(self.view)
            .viewCircle(1, 4, UIColor.brown)
        
        _ = TextView(makeRect(10, textFiled1.bottom()+yOffset, phoneWidth-20, 100))
            .textViewFont(fnt(14))
            .textViewAlign(.left)
            .textViewborder(1, UIColor.orange)
            .textViewTextColor(UIColor.orange)
            .textViewText("SWFBuilder是基于Swift4.0以上的快速编程组件，通过extension的方法重写了UIKit和Foundation的常用属性,通过链式调用的方式,快速构建界面，也可以更加方便的使用工具类完成功能的设计。")
            .viewIntoView(self.view)
        
        DoInMainAfter(3) {
            Dlog("延迟3秒后主线程执行 \(Thread.current)")
        }
        
        DoInConcurrent {
            Dlog("子线程并发: \(Thread.current)")
        }
        
        DoInConcurrent {
            Dlog("子线程串行 \(Thread.current)")
        }
        
        DoInMain {
            Dlog("主线程执行 \(Thread.current)")
        }
        
    }

    
    @objc func clickBtn(sender: UIButton) {
        Dlog("click \(sender)")
        self.navigationController?.pushViewController(WKWebViewController("https://www.baidu.com"), animated: true)
    }
    
    //选择点击后的事件
    @objc func segmentedControlChanged(sender:UISegmentedControl) {
        Dlog(sender.selectedSegmentIndex)
    }
}

