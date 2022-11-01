//
//  DIshListTableViewCell.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 01.11.2022.
//

import UIKit

class DIshListTableViewCell: UITableViewCell {
    static let identifier = "DIshListTableViewCell"

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        dishTitleLabel.text = dish.name
        descriptionLabel.text = dish.description
    }
    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        dishTitleLabel.text = order.dish?.name
        descriptionLabel.text = order.namePerson
    }
}
