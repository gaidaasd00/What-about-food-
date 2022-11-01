//
//  ListViewController.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 01.11.2022.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    var dishes: [Dish]  = [
        .init(
            id: "id1",
            name: "Gleb",
            description: "This cool and tasty",
            image: "https://picsum.photos/100/200",
            calories: 34
        ),
        .init(
            id: "id1",
            name: "Alex",
            description: "This cool and tasty2",
            image: "https://picsum.photos/100/200",
            calories: 100
        ),
        .init(
            id: "id1",
            name: "Svyat",
            description: "This cool and tasty3",
            image: "https://picsum.photos/100/200",
            calories: 323
        ),
        .init(
            id: "id1",
            name: "Alexander",
            description: "This cool and tasty4",
            image: "https://picsum.photos/100/200",
            calories: 312
        )
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        registerCells()
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
