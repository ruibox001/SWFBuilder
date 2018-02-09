//
//  UITableView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func TableView() -> UITableView {
    return UITableView.init(frame: makeRect(0, 0, 0, 0), style: UITableViewStyle.plain)
}

func TableView(_ rect: CGRect) -> UITableView {
    return UITableView.init(frame: rect, style: UITableViewStyle.plain)
}

func TableView(_ style: UITableViewStyle) -> UITableView {
    return UITableView.init(frame: makeRect(0, 0, 0, 0), style: style)
}
func TableView(_ rect: CGRect, _ style: UITableViewStyle) -> UITableView {
    return UITableView.init(frame: rect, style: style)
}

extension UITableView
{
    
    func tableViewReusableCell(_ id: String) -> UITableViewCell {
        var cell: UITableViewCell? = self.dequeueReusableCell(withIdentifier: id)
        if cell == nil {
            cell = TableVCell(id)
        }
        return cell!
    }
    
    func tableViewReusableCell(_ style: UITableViewCellStyle, _ id: String) -> UITableViewCell {
        var cell: UITableViewCell? = self.dequeueReusableCell(withIdentifier: id)
        if cell == nil {
            cell = TableVCell(style, id)
        }
        return cell!
    }
    
    func tableViewRowHeight(_ height: CGFloat) -> UITableView {
        self.rowHeight = height
        return self
    }
    
    func tableViewHeaderHeight(_ height: CGFloat) -> UITableView {
        self.sectionHeaderHeight = height
        return self
    }
    
    func tableViewFooterHeight(_ height: CGFloat) -> UITableView {
        self.sectionFooterHeight = height
        return self
    }
    
    func tableViewEstimatedRowHeight(_ height: CGFloat) -> UITableView {
        self.estimatedRowHeight = height
        return self
    }
    
    func tableViewEstimatedHeaderHeight(_ height: CGFloat) -> UITableView {
        self.estimatedSectionHeaderHeight = height
        return self
    }
    
    func tableViewEstimatedFooterHeight(_ height: CGFloat) -> UITableView {
        self.estimatedSectionFooterHeight = height
        return self
    }
    
    func tableViewSeperatorInset(_ insets: UIEdgeInsets) -> UITableView {
        self.separatorInset = insets
        return self
    }
    
    func tableViewDelegate(_ delegate: UITableViewDelegate?) -> UITableView {
        self.delegate = delegate
        return self
    }
    
    func tableViewDataSource(_ dataSource: UITableViewDataSource?) -> UITableView {
        self.dataSource = dataSource
        return self
    }
    
    func tableViewHeaderView(_ view: UIView?) -> UITableView {
        self.tableHeaderView = view
        return self
    }
    
    func tableViewSeparatorStyle(_ style: UITableViewCellSeparatorStyle) -> UITableView {
        self.separatorStyle = style
        return self
    }
    
    func tableViewFooterView(_ view: UIView?) -> UITableView {
        self.tableFooterView = view
        return self
    }
    
    func tableViewReload(_ indexPath: IndexPath) -> UITableView {
        self.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
        return self
    }
    
    
    /*********************** 无数据的界面提示 ********************/
    
    private var nodata: TableViewNoData? {
        get {
            return objc_getAssociatedObject(self, &TableViewNoData.Key) as? TableViewNoData
        }
        set {
            if let newValue = newValue  {
                objc_setAssociatedObject(self, &TableViewNoData.Key, newValue as TableViewNoData?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    private func getNoDataView() -> TableViewNoData {
        if self.nodata == nil {
            self.nodata = TableViewNoData();
        }
        return self.nodata!;
    }
    
    open static func initializes() {
        self.objSwizzlingOrReplaceMethod(originSelector: #selector(reloadData), newSelector: #selector(cus_reloadData))
    }
    
    @objc private func cus_reloadData(){
        if self.nodata == nil {   //没有启动
            self.cus_reloadData()
            return
        }
        
        if !self.getNoDataView().showWhenCreate {
            self.getNoDataView().showWhenCreate = true
        }
        else {
            let show = shouldShowNoDataView(self.getNoDataView().ignoreHeaderFooter)
            self.getNoDataView().nodataViewNeedShow(show)
        }
        self.cus_reloadData()
    }
    
    private func shouldShowNoDataView(_ ignoreHeaderFooter: Bool) -> Bool {
        
        let delegate: UITableViewDelegate? = self.delegate
        let src: UITableViewDataSource? = self.dataSource
        var sections = 1
        
        if (src?.responds(to: #selector(UITableViewDataSource.numberOfSections(in:))))! {
            sections = (src?.numberOfSections!(in: self))!
        }
        
        if (!ignoreHeaderFooter) {
            
            if self.tableHeaderView != nil {
                let n: String? = className(self.tableHeaderView!)
                if (n != nil && n != TableViewNoData.TableViewIgnoreHeaderFooterViewName) {
                    return false
                }
            }
            
            if self.tableFooterView != nil {
                let n: String? = className(self.tableFooterView!)
                if (n != nil && n != TableViewNoData.TableViewIgnoreHeaderFooterViewName) {
                    return false
                }
            }
        }
        
        for i in 0...(sections-1) {
            
            if (!ignoreHeaderFooter) {
                
                if (delegate?.responds(to: #selector(UITableViewDelegate.tableView(_:viewForHeaderInSection:))))! {
                    if ((delegate?.tableView!(self, viewForHeaderInSection: i)) != nil) {
                        return false
                    }
                }
                
                if (delegate?.responds(to: #selector(UITableViewDelegate.tableView(_:viewForFooterInSection:))))! {
                    if ((delegate?.tableView!(self, viewForFooterInSection: i)) != nil) {
                        return false
                    }
                }
                
            }
            
            let num: Int = (src?.tableView(self, numberOfRowsInSection: i))!
            if num > 0 {
                return false
            }
        }
        return true
    }
    
    func tableViewAddNoData(_ image: UIImage?, _ offsetY: CGFloat, _ ignoreHeaderFooter: Bool, _ showWhenCreate: Bool, _ clickBlock: TableViewNoData.NoDataBlock?) {
        self.getNoDataView().addNoData(self,image,offsetY,ignoreHeaderFooter,showWhenCreate,clickBlock)
    }
    
    func tableViewSetNoDataImageWidth(_ width: CGFloat) {
        if self.nodata != nil {
            self.getNoDataView().tableViewSetNoDataImageWidth(width)
        }
    }
    
}

public class TableViewNoData: NSObject {
    
    public static var Key = "TableViewNoDataKey";
    public static var TableViewIgnoreHeaderFooterViewName = "UIView"
    private let img = DF_TableViewNoDataImage
    
    public typealias NoDataBlock = ( (_ view: UIView)->Void )
    
    private var table: UITableView?
    private var image: UIImage?
    private var offsetY: CGFloat = 0
    var ignoreHeaderFooter: Bool = false
    var showWhenCreate: Bool = false
    private var cBlock: NoDataBlock?
    
    private lazy var imgView: UIImageView = {
        let i = UIImageView();
        return i
    }()
    
    func addNoData(_ table: UITableView, _ image: UIImage?, _ offsetY: CGFloat, _ ignoreHeaderFooter: Bool, _ showWhenCreate: Bool, _ clickBlock: TableViewNoData.NoDataBlock?) {
        self.table = table
        self.image = image
        if self.image == nil {
            self.image = img
        }
        self.offsetY = offsetY
        self.ignoreHeaderFooter = ignoreHeaderFooter
        self.showWhenCreate = showWhenCreate
        self.cBlock = clickBlock
        
        self.imgView.image = self.image
        self.imgView.frame = makeRect(((table.frame.rectW()) - (self.image?.imageW())!)*0.5, ((table.frame.rectH())-(self.image?.imageH())!)*0.5+offsetY, (self.image?.imageW())!, (self.image?.imageH())!)
        table.addSubview(self.imgView.viewClick(self, #selector(clickImage)).viewIsHidden(true))
    }
    
    func nodataViewNeedShow(_ show: Bool) {
        self.imgView.isHidden = !show
    }
    
    func tableViewSetNoDataImageWidth(_ w: CGFloat) {
        let size: CGSize = makeSize(w, (self.image?.imageScaleHeight(w))!)
        self.imgView.frame = makeRect(((self.table?.frame.rectW())! - size.width)*0.5, ((self.table?.frame.rectH())!-size.height)*0.5+offsetY, size.width, size.height)
    }
    
    @objc private func clickImage() {
        if self.cBlock != nil {
            self.cBlock!(self.imgView)
        }
    }
    
}

