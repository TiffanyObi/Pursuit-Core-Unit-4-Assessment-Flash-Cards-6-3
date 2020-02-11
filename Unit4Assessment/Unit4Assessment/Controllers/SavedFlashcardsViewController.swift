//
//  SavedFlashcardsViewController.swift
//  Unit4Assessment
//
//  Created by Tiffany Obi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SavedFlashcardsViewController: UIViewController {
    
    private let savedFlashcardsView = SavedFlashcardView()
    
    
    
    override func loadView() {
        super.loadView()
        view = savedFlashcardsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        
        savedFlashcardsView.collectionView.dataSource = self
        savedFlashcardsView.collectionView.delegate = self
        
        savedFlashcardsView.collectionView.register(SavedFlashcardCell.self, forCellWithReuseIdentifier: "savedFlachcardCell")
        
    }
    

}

extension SavedFlashcardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "savedFlachcardCell", for: indexPath) as? SavedFlashcardCell else {
            fatalError("could not downcast to SavedFlashcardCell")
        }
        cell.backgroundColor = .green
        cell.congifureCell()
        return cell
    }
    
    
}


extension SavedFlashcardsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize:CGSize = UIScreen.main.bounds.size
        let itemSpacing:CGFloat = 10
        let numberOfItems: CGFloat = 2
        let itemHeight: CGFloat = maxSize.height * 0.30
        let totalSpacing: CGFloat = (itemSpacing * 2) + (numberOfItems - 1) * itemSpacing
        let itemWidth: CGFloat = (maxSize.width - totalSpacing) / numberOfItems
        return CGSize(width: itemWidth, height: itemHeight)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
