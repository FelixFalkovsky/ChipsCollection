//
//  ChipsCustomViewFlowLayout.swift
//  ChipsCollection
//
//  Created by Felix on 17.02.2022.
//

import UIKit

class ChipsCustomViewFlowLayout: UICollectionViewFlowLayout {

  let cellSpacing:CGFloat = 4
  
  required override init() {
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    self.minimumLineSpacing = 4.0
    self.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 8)
    let attributes = super.layoutAttributesForElements(in: rect)
    
    var leftMargin = sectionInset.left
    var maxY: CGFloat = -1.0
    attributes?.forEach { layoutAttribute in
      if layoutAttribute.frame.origin.y >= maxY {
        leftMargin = sectionInset.left
      }
      layoutAttribute.frame.origin.x = leftMargin
      leftMargin += layoutAttribute.frame.width + cellSpacing
      maxY = max(layoutAttribute.frame.maxY , maxY)
    }
    return attributes
  }
  
  //    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
  //  
  //      guard let attributes = super.layoutAttributesForElements(in:rect) else { return [] }
  //  
  //      var leftMargin: CGFloat = sectionInset.left
  //      var maxY: CGFloat = -1.0
  //      let cellHeight: CGFloat = 40.0
  //  
  //      attributes.forEach { layoutAttribute in
  //       // let cell = viewController.widthChips()
  //        layoutAttribute.bounds.size.width = cell
  //        layoutAttribute.bounds.size.height = cellHeight
  //  
  //        if layoutAttribute.frame.origin.y >= cell {
  //          //layoutAttribute.frame.origin.x = cell + 10
  //          leftMargin = layoutAttribute.frame.origin.x + cell
  //        } else {
  //          leftMargin = cell + 120
  //        }
  //  
  //        layoutAttribute.frame.origin.x = cell
  //  
  //        let delegate = collectionView?.delegate as? UICollectionViewDelegateFlowLayout
  //        let spacing = delegate?.collectionView?(collectionView!, layout: self, minimumInteritemSpacingForSectionAt: 0) ?? minimumInteritemSpacing
  //  
  //        leftMargin += layoutAttribute.bounds.size.width + 10
  //        maxY = max(layoutAttribute.frame.maxY , maxY)
  //      }
  //      return attributes
  //    }
  
}

