//
//  UIStackView+Extension.swift
//  ChipsCollection
//
//  Created by Felix on 17.02.2022.
//

import UIKit

public extension UIStackView {

    /// Add the passed subviews as arranged subviews
    /// - Parameter viewContainers: the views to be added as arranged subviews
    func addArrangedSubviews(_ viewContainers: [ViewContainer]) {
        for view in viewContainers.views {
            addArrangedSubview(view)
        }
    }

    /// Add the passed subviews as arranged subviews
    /// - Parameter viewContainers: the views to be added as arranged subviews
    func addArrangedSubviews(_ viewContainers: ViewContainer...) {
        addArrangedSubviews(viewContainers)
    }

    /// Add the passed views as arranged subviews, then return self for compositional use
    /// - Parameter views: the views to be added as arranged subviews
    /// - Returns: this view
    func addingArrangedSubviews(_ viewContainers: [ViewContainer]) -> Self {
        addArrangedSubviews(viewContainers)
        return self
    }

    /// Add the passed views as arranged subviews, then return self for compositional use
    /// - Parameter views: the views to be added as arranged subviews
    /// - Returns: this view
    func addingArrangedSubviews(_ viewContainers: ViewContainer...) -> Self {
        addArrangedSubviews(viewContainers)
        return self
    }
  
  func setBackgroundColor(color: UIColor) {
      if #available(iOS 14.0, *) {
        self.backgroundColor = color
      } else {
        // Fallback to manually adding background layer
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(rect: self.bounds).cgPath
        layer.fillColor = color.cgColor
        self.layer.insertSublayer(layer, at: 0)
      }
    }

}

/// A protocol that defines a view or a collection of views. The intent of this is to allow easy flattening of collections that include both views and nested collections of views (ie [view0 [view1, view2], view3] -> [view0, view1, view2, view3])
public protocol ViewContainer {

    var views: [UIView] { get }

}

extension Array: ViewContainer where Element == ViewContainer {

    public var views: [UIView] {
        flatMap { $0.views }
    }

}

extension UIView: ViewContainer {

    public var views: [UIView] {
        [self]
    }

}
