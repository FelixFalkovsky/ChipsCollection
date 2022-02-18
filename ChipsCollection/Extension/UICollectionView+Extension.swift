//
//  UICollectionView+Extension.swift
//  ChipsCollection
//
//  Created by Felix on 17.02.2022.
//
import UIKit

public extension UICollectionViewCell {

    static var reuseIdentifier: String {
        String(describing: self)
    }

}

public extension UICollectionView {

    func register<T>(_ cellClass: T.Type) where T: UICollectionViewCell {
        register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }

    func dequeue<T>(_ cellClass: T.Type, for indexPath: IndexPath) -> T where T: UICollectionViewCell {
        dequeueReusableCell(withReuseIdentifier: cellClass.reuseIdentifier, for: indexPath) as! T
    }

}
