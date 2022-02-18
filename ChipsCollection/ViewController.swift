//
//  ViewController.swift
//  ChipsCollection
//
//  Created by Felix on 17.02.2022.
//

import UIKit

struct Compani {
  let name: String
  let image: UIImage
}

class ViewController: UIViewController, UICollectionViewDelegate {
  
  var chipsArray = [
    Compani(name: "Nykaa", image: UIImage(named: "image_1")!),
    Compani(name: "Asian paints", image: UIImage(named: "image_2")!),
    Compani(name: "Cipla", image: UIImage(named: "image_3")!),
    Compani(name: "Bank of Baroda", image: UIImage(named: "image_4")!),
    Compani(name: "Airtel", image: UIImage(named: "image_5")!),
    Compani(name: "IOC", image: UIImage(named: "image_1")!),
    Compani(name: "IOC", image: UIImage(named: "image_2")!),
    Compani(name: "Nykaa", image: UIImage(named: "image_3")!),
    Compani(name: "Nykaa", image: UIImage(named: "image_4")!),
    Compani(name: "Nykaa", image: UIImage(named: "image_5")!),
    Compani(name: "Asian paints", image: UIImage(named: "image_1")!),
    Compani(name: "Cipla", image: UIImage(named: "image_2")!),
    Compani(name: "Bank of Baroda", image: UIImage(named: "image_4")!),
    Compani(name: "Airtel", image: UIImage(named: "image_1")!),
    Compani(name: "IOC", image: UIImage(named: "image_2")!),
    Compani(name: "IOC", image: UIImage(named: "image_4")!),
    Compani(name: "Nykaa", image: UIImage(named: "image_3")!),
    Compani(name: "Nykaa", image: UIImage(named: "image_5")!),
    Compani(name: "Nykaa", image: UIImage(named: "image_2")!),
    Compani(name: "Asian paints", image: UIImage(named: "image_1")!),
    Compani(name: "Cipla", image: UIImage(named: "image_4")!)
  ]
  
  private var chipsCard = ChipsView()
  
  private lazy var collectionView: UICollectionView = {
    let layout = ChipsCustomViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 5
   // layout.estimatedItemSize = CGSize(width: 0, height: 40)
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(ChipsCollectionViewCell.self)
    collectionView.collectionViewLayout = layout
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .systemBackground
    collectionView.contentInsetAdjustmentBehavior = .always
    collectionView.isScrollEnabled = true
    collectionView.isUserInteractionEnabled = true
    collectionView.showsHorizontalScrollIndicator = true
    return collectionView
  }()
  
  private var scrollViewContentSize: CGFloat = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    settingsUI()
  }
  
  private func settingsUI() {
    
    view.addingSubviewsForAutoLayout([
      collectionView
    ])
    collectionView.addSubview(chipsCard)
    
    NSLayoutConstraint.activate([
      
      collectionView.heightAnchor.constraint(equalToConstant: 150),
      collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
  }
  
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
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
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let string = chipsArray[indexPath.row].name
    let size = string.size(OfFont: UIFont.systemFont(ofSize: 13))
    let spacingMargin: CGFloat = 62.0
    let cellWidth = size.width + spacingMargin
    return CGSize(width: cellWidth, height: 40)
  }
  
}
  


extension String {
  
  func widthOfString(usingFont font: UIFont) -> CGFloat {
    let fontAttributes = [NSAttributedString.Key.font: font]
    let size = self.size(withAttributes: fontAttributes)
    return size.width
  }
  
  func size(OfFont font: UIFont) -> CGSize {
    return (self as NSString).size(withAttributes: [NSAttributedString.Key.font: font])
  }
}
