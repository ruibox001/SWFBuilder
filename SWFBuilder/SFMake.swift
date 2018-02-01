//
//  SFUtils.swift
//  TestSwift
//
//  Created by wsy on 2018/1/17.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func makePoint(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
    return CGPoint.init(x: x, y: y)
}

func makeSize(_ w: CGFloat, _ h: CGFloat) -> CGSize {
    return CGSize.init(width: w, height: h)
}

func makeRect(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h:CGFloat) -> CGRect {
    return CGRect.init(x: x, y: y, width: w, height: h)
}

func makeRect(_ w: CGFloat, _ h:CGFloat) -> CGRect {
    return CGRect.init(x: 0, y: 0, width: w, height: h)
}

func makeNsIndexPath(_ section: Int, _ row: Int) -> NSIndexPath {
    return NSIndexPath.init(row: row, section: section)
}

func makeIndexPath(_ section: Int, _ row: Int) -> IndexPath {
    return IndexPath.init(row: row, section: section)
}

func makeInsets(_ t: CGFloat, _ l: CGFloat, _ b: CGFloat, _ r: CGFloat) -> UIEdgeInsets {
    return UIEdgeInsets.init(top: t, left: l, bottom: b, right: r)
}

