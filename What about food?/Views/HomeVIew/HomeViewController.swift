//
//  HomeViewController.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 26.10.2022.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Russian Dish1", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Russian Dish2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Russian Dish3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Russian Dish4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Russian Dish5", image: "https://picsum.photos/100/200")
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "What about food?"
        
        registerXIB()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self

    }
    private func registerXIB() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
}

//MARK: - Extension
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return CategoryCollectionViewCell()}
        cell.setup(category: categories[indexPath.row])
        return cell
    }
    
    
}
