//
//  ListOrdersViewController.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 01.11.2022.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(
            id: "id1",
            namePerson: "Alex Gaida",
            dish: .init(
            id: "id1",
            name: "Gleb",
            description: "This cool and tasty",
            image: "https://picsum.photos/100/200",
            calories: 34
        )),
        .init(
            id: "id1",
            namePerson: "Alex Gaida",
            dish: .init(
            id: "id1",
            name: "Gleb",
            description: "This cool and tasty",
            image: "https://picsum.photos/100/200",
            calories: 34
        )),
        .init(
            id: "id1",
            namePerson: "Alex Gaida",
            dish: .init(
            id: "id1",
            name: "Gleb",
            description: "This cool and tasty",
            image: "https://picsum.photos/100/200",
            calories: 34
        )),
        .init(
            id: "id1",
            namePerson: "Alex Gaida",
            dish: .init(
            id: "id1",
            name: "Gleb",
            description: "This cool and tasty",
            image: "https://picsum.photos/100/200",
            calories: 34
        ))
    ]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCells()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DIshListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DIshListTableViewCell.identifier)
    }
}

extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DIshListTableViewCell.identifier) as? DIshListTableViewCell else { return DIshListTableViewCell()}
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
