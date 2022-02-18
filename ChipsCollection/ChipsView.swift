//
//  ChipsView.swift
//  ChipsCollection
//
//  Created by Felix on 17.02.2022.
//
import UIKit

public class ChipsView: UIView {

  // MARK: - Properties

  override public var intrinsicContentSize: CGSize {
      return CGSize(width: UIView.layoutFittingExpandedSize.width, height: super.intrinsicContentSize.height)
  }
  
  private let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.alignment = .center
    stackView.distribution = .equalSpacing
    stackView.spacing = 8
    stackView.isLayoutMarginsRelativeArrangement = false
    return stackView
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    return label
  }()
  
  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleToFill
    imageView.layer.cornerRadius = 15
    imageView.layer.masksToBounds = true
    return imageView
  }()
  
  public init() {
    super.init(frame: .zero)
    
    backgroundColor = .systemGray4
    layer.cornerRadius = 20

    addSubviewsForAutoLayout(
      stackView.addingArrangedSubviews([
        imageView,
        titleLabel
      ])
    )
    
    NSLayoutConstraint.activate([
      imageView.widthAnchor.constraint(equalToConstant: 32),
      imageView.heightAnchor.constraint(equalToConstant: 32),
      imageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 4),

      stackView.heightAnchor.constraint(equalToConstant: 40),
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  @available(*, unavailable, message: "init(coder:) has not been implemented")
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func configure(title: String, image: UIImage?) {
    titleLabel.text = title
    imageView.image = image
  }
  
}

