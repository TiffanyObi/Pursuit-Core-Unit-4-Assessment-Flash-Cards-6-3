//
//  SearchFlashcardsViewController.swift
//  Unit4Assessment
//
//  Created by Tiffany Obi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class SearchFlashcardsViewController: UIViewController {
    
    private let searchFlashcardView = SearchFlashcardView()
    public var dataPersistence: DataPersistence<Details>!
    
    public var cards = [Details]() {
        didSet {
        DispatchQueue.main.async {
            
            self.searchFlashcardView.collectionView.reloadData()
            
        }
    
    }
}
    override func loadView() {
        super.loadView()
        
        view = searchFlashcardView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFlashcards()

        view.backgroundColor = .darkGray
        searchFlashcardView.collectionView.dataSource = self
        searchFlashcardView.collectionView.delegate  = self
        
        searchFlashcardView.collectionView.register(SearchFlashcardCell.self, forCellWithReuseIdentifier: "searchCardCell")
    }
    
    func loadFlashcards() {
        
        SearchFlashcardsAPIClient.getFlashcards { [weak self] (result) in
            switch result {
                
            case .failure(let error):
            print(" error- \(error)")
                
            case .success(let flashcards):
                
                DispatchQueue.main.async {
                    self?.cards = flashcards
                }
                
            }
        }
    }
    

   
}

extension SearchFlashcardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCardCell", for: indexPath) as? SearchFlashcardCell else {
            fatalError("could not downcast to SearchFlashcardCell")
        }
        
        let cellInRow = cards[indexPath.row]
        cell.backgroundColor = .systemGray5
        cell.configureCell(for: cellInRow)
        
        return cell
    }
    
    
    
}

extension SearchFlashcardsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize:CGSize = UIScreen.main.bounds.size
        let itemSpacing:CGFloat = 20
        let numberOfItems: CGFloat = 1
        let itemHeight: CGFloat = maxSize.height * 0.30
        let totalSpacing: CGFloat = (itemSpacing * 2) + (numberOfItems - 1) * itemSpacing
        let itemWidth: CGFloat = (maxSize.width - totalSpacing) / numberOfItems
        return CGSize(width: itemWidth, height: itemHeight)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
    }
}
