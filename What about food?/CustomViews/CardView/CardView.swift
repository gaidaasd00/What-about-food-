//
//  CardView.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 26.10.2022.
//

import UIKit

class CardView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSettings()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSettings()
    }
    
    private func initialSettings() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        cornerRadius = 10
    }
}
