//
//  UITableView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func CollectionViewFlowLayout() -> UICollectionViewFlowLayout {
    return UICollectionViewFlowLayout()
}

extension UICollectionViewFlowLayout
{
    
    func collectionViewFlowLayoutItemSize(_ size: CGSize) -> UICollectionViewFlowLayout {
        self.itemSize = size
        return self
    }
    
    func collectionViewFlowLayoutHoriSpace(_ space: CGFloat) -> UICollectionViewFlowLayout {
        self.minimumInteritemSpacing = space
        return self
    }
    
    func collectionViewFlowLayoutVeriSpace(_ space: CGFloat) -> UICollectionViewFlowLayout {
        self.minimumLineSpacing = space
        return self
    }
    
    func collectionViewFlowLayoutScrollDirection(_ dire: UICollectionViewScrollDirection) -> UICollectionViewFlowLayout {
        self.scrollDirection = dire
        return self
    }
    
    func collectionViewFlowLayoutSectionInset(_ inset: UIEdgeInsets) -> UICollectionViewFlowLayout {
        self.sectionInset = inset
        return self
    }
    
    func collectionViewFlowLayout() -> UICollectionViewFlowLayout {
        return self
    }
    
}

