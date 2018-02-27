//
//  ExampleViewController.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 16/5/16.
//  Copyright © 2017年 Egg Swift. All rights reserved.
//

import Foundation
import UIKit

public class TableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var table: UITableView?
    
    private lazy var datas: NSMutableArray = {
        let d: NSMutableArray = NSMutableArray()
        return d
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addTitle(title: "字体测试")
        self.addLeft(anyObject: nil, block: nil)
        self.addRight(anyObject: "进度" as AnyObject) { (view: UIView) in
            _ = IndicatorViewShow(UIColor.gray, afterDismiss: 5)
        }
        
        table = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.plain)
        self.view.addSubview(table!)
        table?.delegate = self
        table?.dataSource = self
        table?.rowHeight = 40
        table?.separatorStyle = UITableViewCellSeparatorStyle.none
        table?.tableViewAddNoData(nil, -80, false, true, { (_ view: UIView) in
            Dlog("click: \(view)")
        })
        table?.tableViewSetNoDataImageWidth(150)
        
        let ary = UIFont.FontFamilyNames()
        Dlog("\(fnt(12).familyName) > \(fnt(12).fontName)")
        for item in ary {
            Dlog("name: \(item)")
            self.datas.add(item)
        }
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "cellid"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: id)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: id)
        }
        
        let fontName: String = self.datas[indexPath.row] as! String
        cell?.textLabel?.font = fnt(14, name: fontName)
        cell?.textLabel?.text = "字体: \(fontName)"
        
        return cell!
    }

    deinit {
        Dlog("SELF: \(self)")
    }
    
}
