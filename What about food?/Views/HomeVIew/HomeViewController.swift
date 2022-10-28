//
//  HomeViewController.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 26.10.2022.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Russian Dish1", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Russian Dish2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Russian Dish3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Russian Dish4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Russian Dish5", image: "https://picsum.photos/100/200")
    
    ]
    
    var popularDisher: [Dish] = [
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
        title = "What about food?"
        
        registerXIB()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self

    }
    private func registerXIB() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
    }
}

//MARK: - Extension
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return popularDisher.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return CategoryCollectionViewCell()}
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as? DishPortraitCollectionViewCell else { return DishPortraitCollectionViewCell()}
            cell.setup(dish: popularDisher[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
