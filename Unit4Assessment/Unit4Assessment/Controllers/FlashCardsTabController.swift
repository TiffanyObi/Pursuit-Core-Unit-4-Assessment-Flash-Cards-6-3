//
//  FlashCardsTabController.swift
//  Unit4Assessment
//
//  Created by Tiffany Obi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class FlashCardsTabController: UITabBarController {
    

//    private var dataPersistence = DataPersistence<Article>(filename: "savedArticles.plist")

    private lazy var  savedFlashcardVC: SavedFlashcardsViewController = {
        let viewController = SavedFlashcardsViewController()
        
        viewController.tabBarItem = UITabBarItem(title: "Cards", image: UIImage(systemName: "text.quote"), tag: 0)
//        viewController.dataPersistence = dataPersistence
        return viewController
        
    }()
    
    private lazy var  createFlashcardVC: CreateFlashcardViewController = {
        let viewController = CreateFlashcardViewController()
        viewController.tabBarItem = UITabBarItem(title: "Create", image: UIImage(systemName: "square.and.pencil"), tag: 1)
//        viewController.dataPersistence = dataPersistence
//        viewController.dataPersistence.delegate = viewController
        return viewController
        
    }()
    
    private lazy var  searchFlashVC:SearchFlashcardsViewController = {
        let viewController = SearchFlashcardsViewController()
        viewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        return viewController
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        viewControllers = [UINavigationController(rootViewController:savedFlashcardVC),UINavigationController(rootViewController:createFlashcardVC),UINavigationController(rootViewController:searchFlashVC)]
        // Do any additional setup after loading the view.
    }
    

    
    

}
