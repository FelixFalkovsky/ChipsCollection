//
//  ChipsCollectionView.swift
//  ChipsCollection
//
//  Created by Felix on 17.02.2022.
//

import UIKit


public class ChipsCollectionView: UIView, UICollectionViewDelegate {
  
  override public var intrinsicContentSize: CGSize {
    return CGSize(width: UIView.layoutFittingExpandedSize.width, height: UIView.layoutFittingCompressedSize.height)
  }
  var chipsArray = [
    Compani(name: "Nykaa", image: UIImage(named: "image_1")!),
    Compani(name: "Asian paints", image: UIImage(named: "image_1")!),
    Compani(name: "Cipla", image: UIImage(named: "image_1")!),
    Compani(name: "Bank of Baroda", image: UIImage(named: "image_1")!),
    Compani(name: "Airtel", image: UIImage(named: "image_1")!),
    Compani(name: "IOC", image: UIImage(named: "image_1")!),
    Compani(name: "IOC", image: UIImage(named: "image_1")!),
    Compani(name: "Nykaa", image: UIImage(named: "image_1")!),
    Compani(name: "Nykaa", image: UIImage(named: "image_1")!),
    Compani(name: "Nykaa", image: UIImage(named: "image_1")!),
    Compani(name: "Asian paints", image: UIImage(named: "image_1")!),
    Compani(name: "Cipla", image: UIImage(named: "image_1")!),
    Compani(name: "Bank of Baroda", image: UIImage(named: "image_1")!),
    Compani(name: "Airtel", image: UIImage(named: "image_1")!),
    Compani(name: "IOC", image: UIImage(named: "image_1")!),
    Compani(name: "IOC", image: UIImage(named: "image_1")!),
    Compani(name: "Nykaa", image: UIImage(named: "image_1")!),
    Compani(name: "Nykaa", image: UIImage(named: "image_1")!),
    Compani(name: "Nykaa", image: UIImage(named: "image_1")!),
    Compani(name: "Asian paints", image: UIImage(named: "image_1")!),
    Compani(name: "Cipla", image: UIImage(named: "image_1")!)
  ]
  
  private lazy var collectionView: UICollectionView = {
    let layout = ChipsCustomViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(ChipsCollectionViewCell.self)
    collectionView.collectionViewLayout = layout
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .white
    collectionView.contentInsetAdjustmentBehavior = .automatic
    collectionView.isScrollEnabled = true
    collectionView.isUserInteractionEnabled = true
    collectionView.showsHorizontalScrollIndicator = true
    return collectionView
  }()
  
  private let scrollView: UIScrollView = {
    let scrollView = UIScrollView(frame: .zero)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.showsHorizontalScrollIndicator = true
    scrollView.isScrollEnabled = true
    return scrollView
  }()
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubviewsForAutoLayout([collectionView])
    
    NSLayoutConstraint.activate([
      collectionView.heightAnchor.constraint(equalToConstant: 160),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      collectionView.topAnchor.constraint(equalTo: topAnchor),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    collectionView.reloadData()
    collectionView.layoutIfNeeded()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension ChipsCollectionView: UICollectionViewDataSource {
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return chipsArray.count
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(ChipsCollectionViewCell.self, for: indexPath)
    cell.chipsCell.configure(
      title: chipsArray[indexPath.row].name,
      image: chipsArray[indexPath.row].image
    )
    return cell
  }
  
}


