//
//  CreateFlashcardViewController.swift
//  Unit4Assessment
//
//  Created by Tiffany Obi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class CreateFlashcardViewController: UIViewController {

    
    public var dataPersistence: DataPersistence<Details>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
    

   

}

extension CreateFlashcardViewController: DataPersistenceDelegate {
    
    func didSaveItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
       
        
    }
    
    func didDeleteItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
     
    }

}
