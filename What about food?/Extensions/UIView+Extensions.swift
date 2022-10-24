//
//  UIView+Extensions.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 24.10.2022.
//

import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat {
       get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
