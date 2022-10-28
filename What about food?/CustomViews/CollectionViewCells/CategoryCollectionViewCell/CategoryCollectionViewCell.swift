//
//  CategoryCollectionViewCell.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 26.10.2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
  
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    func setup(category: DishCategory) {
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }
}
