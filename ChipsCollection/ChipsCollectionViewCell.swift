//
//  ChipsCollectionViewCell.swift
//  ChipsCollection
//
//  Created by Felix on 17.02.2022.
//

import UIKit

public class ChipsCollectionViewCell: UICollectionViewCell {
  
  public let chipsCell = ChipsView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addingSubviewsForAutoLayout([
      chipsCell
    ])
    
    NSLayoutConstraint.activate([
      chipsCell.topAnchor.constraint(equalTo: contentView.topAnchor),
      chipsCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      chipsCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      chipsCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
