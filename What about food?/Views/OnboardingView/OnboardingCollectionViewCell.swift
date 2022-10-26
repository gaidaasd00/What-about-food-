//
//  OnboardingCollectionViewCell.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 24.10.2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLebel: UILabel!
    @IBOutlet weak var slideDescriptionLebel: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLebel.text = slide.title
        slideDescriptionLebel.text = slide.description
    }
    
}
