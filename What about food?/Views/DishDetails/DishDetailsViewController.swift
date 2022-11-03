//
//  DishDetailsViewController.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 29.10.2022.
//

import UIKit
import ProgressHUD


class DishDetailsViewController: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateValue()
    }
    
    private func populateValue() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }
    
    @IBAction func pleceOrderButtonPressed(_ sender: UIButton) {
        guard let name = nameTextField.text?.trimmingCharacters(in: .whitespaces),
              !name.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        ProgressHUD.show("Place order...")
        NetworkService.shared.placeOrder(dishID: dish.id ?? "", name: name) { result in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
}
