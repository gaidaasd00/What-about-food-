//
//  ListOrdersViewController.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 01.11.2022.
//

import UIKit
import ProgressHUD

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCells()
        ProgressHUD.show()
    }
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrders { [ weak self] result in
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                self?.orders = orders
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
