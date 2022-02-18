//
//  ChipsScrollView.swift
//  ChipsCollection
//
//  Created by Felix on 17.02.2022.
//

import UIKit

class ChipsScrollView: UIViewController {
  
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
  
  private var arrayChips = [ChipsView]()
  private var chipsCard = ChipsView()
  
  private let scrollView: UIScrollView = {
    let scrollView = UIScrollView(frame: .zero)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.showsHorizontalScrollIndicator = true
    scrollView.isScrollEnabled = true
    scrollView.backgroundColor = .systemBackground
    scrollView.contentSize = CGSize(width: 480, height: 160)
    return scrollView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    settingsUI()
  }
  
  private func settingsUI() {
    
    view.addingSubviewsForAutoLayout([
      scrollView
    ])
    
    chipsCard.frame = CGRect(x: 0, y: 0, width: scrollView.contentScaleFactor, height: 40)
    scrollView.addSubview(chipsCard)
    
    NSLayoutConstraint.activate([
      scrollView.heightAnchor.constraint(equalToConstant: 170),
      scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
    
//    arrayChips.forEach { card in
//      scrollView.addSubview(card)
//    }
    
    for i in 0...chipsArray.count {
      let card = ChipsView()
      //arrayChips = card[i]
      let xPosition = self.view.frame.width * CGFloat(60)
      card.frame = CGRect(x: xPosition, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
      scrollView.contentSize.width = scrollView.frame.width * CGFloat(i) + 1
      scrollView.addSubview(arrayChips[i])
    }
  }
  
  func createChipsArray() -> [ChipsView] {
    for i in chipsArray {
      chipsCard.configure(title: i.name, image: i.image)
      arrayChips.append(chipsCard)
    }
    return arrayChips
  }
}
