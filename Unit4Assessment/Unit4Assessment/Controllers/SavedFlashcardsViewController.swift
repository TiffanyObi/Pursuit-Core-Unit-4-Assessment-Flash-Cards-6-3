//
//  SavedFlashcardsViewController.swift
//  Unit4Assessment
//
//  Created by Tiffany Obi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class SavedFlashcardsViewController: UIViewController {
    
    private let savedFlashcardsView = SavedFlashcardView()
    
    private var savedFlashcards = [Details]() {
        didSet {
            
            if savedFlashcards.isEmpty {
                
                savedFlashcardsView.collectionView.backgroundView = EmptyView(title: "Saved Flashcards", message: "There are currently no saved flashcards. Start browsing by tapping on the search icon.")
                
            } else {
                
                savedFlashcardsView.collectionView.backgroundView = nil
            }
            
            savedFlashcardsView.collectionView.reloadData()
        }
    }
    public var dataPersistence: DataPersistence<Details>!
    
    override func loadView() {
        super.loadView()
        view = savedFlashcardsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSavedCards()
        view.backgroundColor = .yellow
        
        savedFlashcardsView.collectionView.dataSource = self
        savedFlashcardsView.collectionView.delegate = self
        
        savedFlashcardsView.collectionView.register(SavedFlashcardCell.self, forCellWithReuseIdentifier: "savedFlachcardCell")
        
    }
    
    private func loadSavedCards() {
        do {
            savedFlashcards = try dataPersistence.loadItems()
        } catch {
            print("error finding articles")
        }
    }
    
    
    
    
}

extension SavedFlashcardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(savedFlashcards.count)
        return savedFlashcards.count
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
