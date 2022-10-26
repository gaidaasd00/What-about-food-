//
//  OnboardingViewController.swift
//  What about food?
//
//  Created by Алексей Гайдуков on 24.10.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    var slides: [OnboardingSlide] = []
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlide(
                title: "Delicious Dishes",
                description: "Experience a variety of amazing dishes from different cultures around the world.",
                image: UIImage(imageLiteralResourceName: "slide2")
            ),
            OnboardingSlide(
                title: "World-Class Chefs",
                description: "Our dishes are prepared by only the best.",
                image: UIImage(imageLiteralResourceName: "slide1")
            ),
            OnboardingSlide(
                title: "Instant World-Wide Delivery",
                description: "Your orders will be delivered instantly irrespective of your location around the world",
                image: UIImage(imageLiteralResourceName: "slide3")
            )
        ]
        //setting pageControl number pages
        pageControl.numberOfPages = slides.count

        
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //MARK: - @IBAction
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            guard let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as?  UINavigationController else { return }
            
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
            
        } else {
            currentPage += 1
            let indexPath  = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
        }
        
        
    }
}


//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as? OnboardingCollectionViewCell else { return OnboardingCollectionViewCell() }
        cell.setup(slides[indexPath.row])
        return cell
    }
}


//MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
