//
//  UICollectionView+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func CollectionView(_ rect: CGRect) -> UICollectionView {
    return UICollectionView.init(frame: rect, collectionViewLayout: UICollectionViewLayout())
}

func CollectionView(_ rect: CGRect, _ layout: UICollectionViewLayout) -> UICollectionView {
    return UICollectionView.init(frame: rect, collectionViewLayout: layout)
}

extension UICollectionView
{
    
    func collectionViewDelegate(_ delegate: UICollectionViewDelegate?) -> UICollectionView {
        self.delegate = delegate
        return self
    }
    
    func collectionViewDataSource(_ dataSource: UICollectionViewDataSource?) -> UICollectionView {
        self.dataSource = dataSource
        return self
    }
    
    func collectionViewRegisterCell(_ cellClass: AnyClass?, _ id: String) -> UICollectionView {
        self.register(cellClass, forCellWithReuseIdentifier: id)
        return self
    }
    
    func collectionViewRegisterHeaderView(_ cellClass: AnyClass?, _ id: String) -> UICollectionView {
        self.register(cellClass, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: id)
        return self
    }
    
    func collectionViewRegisterFooterView(_ cellClass: AnyClass?, _ id: String) -> UICollectionView {
        self.register(cellClass, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: id)
        return self
    }
    
    func collectionViewReuseableCell(_ id: String, _ indexPath: IndexPath) -> UICollectionViewCell {
        return self.dequeueReusableCell(withReuseIdentifier: id, for: indexPath)
    }
    
}

