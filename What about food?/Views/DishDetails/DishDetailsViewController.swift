//
//  DishDetailsViewController.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 29.10.2022.
//

import UIKit


class DishDetailsViewController: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func pleceOrderButtonPressed(_ sender: UIButton) {
    }
}
