//
//  ListViewController.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 01.11.2022.
//

import UIKit
import ProgressHUD

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    var dishes: [Dish]  = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        registerCells()
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(
            categoryId: category.id ?? ""
        ) { [weak self] result in
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DIshListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DIshListTableViewCell.identifier)
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DIshListTableViewCell.identifier, for: indexPath) as? DIshListTableViewCell else { return DIshListTableViewCell()}
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
