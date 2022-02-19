//
//  ChipsCustomViewFlowLayout.swift
//  ChipsCollection
//
//  Created by Felix on 17.02.2022.
//

import UIKit

protocol MICollectionViewBubbleLayoutDelegate {
  func collectionView(_ collectionView: UICollectionView, itemSizeAt indexPath: NSIndexPath) -> CGSize
}

class ChipsCustomViewFlowLayout: UICollectionViewFlowLayout {
  
  private var itemAttributesCache: Array<UICollectionViewLayoutAttributes> = []
  private var contentSize: CGSize = CGSize.zero
  
  var delegate: MICollectionViewBubbleLayoutDelegate?
  
  override var collectionViewContentSize: CGSize {
    return contentSize
  }
  
  let cellSpacing:CGFloat = 4
  
  required override init() {
    super.init()
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  private func setup() {
    scrollDirection = UICollectionView.ScrollDirection.horizontal
    minimumLineSpacing = 10
    minimumInteritemSpacing = 10
  }
  
  override func prepare() {
    super.prepare()
    
    if (collectionView?.numberOfSections == 0 || collectionView?.numberOfItems(inSection: 0) == 0) {
      return
    }
    
    var x: CGFloat = 0
    var y: CGFloat = 0
    var iSize: CGSize = CGSize.zero
    var collectionWidth: CGFloat = 0.0
    var indexPath: NSIndexPath?
    let numberOfItems: NSInteger = (self.collectionView?.numberOfItems(inSection: 0))!
    itemAttributesCache = []
    
    for index in 0..<numberOfItems {
      
      indexPath = NSIndexPath(item: index, section: 0)
      iSize = (delegate?.collectionView(collectionView!, itemSizeAt: indexPath!)) as! CGSize
      
      var itemRect: CGRect = CGRect(x: x, y: y, width: iSize.width, height: iSize.height)
      if (x >= 900) {
        //...Checking if item width is greater than collection view width then set item in new row.
        itemRect.origin.x = 0
        itemRect.origin.y = y + iSize.height + minimumLineSpacing
      } else if (y >= (collectionView?.frame.height)!) {
        itemRect.origin.x = 0
        itemRect.origin.y = y + iSize.width + minimumLineSpacing
      }
      
      let itemAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath! as IndexPath)
      itemAttributes.frame = itemRect
      itemAttributesCache.append(itemAttributes)
      
      x = itemRect.origin.x + iSize.width + minimumInteritemSpacing
      y = itemRect.origin.y 
    }
    
    x += iSize.height + self.minimumLineSpacing
    y = 0
    
    collectionWidth = (collectionView?.frame.size.width)! * 10 + minimumLineSpacing
    contentSize = CGSize(width: collectionWidth, height: y)
  }
  
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    
    let numberOfItems = (self.collectionView?.numberOfItems(inSection: 0))!
    
    let itemAttributes = itemAttributesCache.filter {
      $0.frame.intersects(rect) &&
      $0.indexPath.row < numberOfItems
    }
    
    return itemAttributes
  }
  
  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    return itemAttributesCache.first {
      $0.indexPath == indexPath
    }
  }
  
}

