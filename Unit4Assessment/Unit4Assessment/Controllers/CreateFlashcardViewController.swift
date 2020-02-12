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

    private let createFlashcardView = CreateFlashcardView()
    public var dataPersistence: DataPersistence<Details>!
    
    override func loadView() {
        super.loadView()
        view = createFlashcardView
    }
    
    private var id = ""
    
    private var question = ""
    private var fact1 = ""
    private var fact2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        createFlashcardView.questionTitleTextFeild.delegate = self
        createFlashcardView.firstFactTextFeild.delegate = self
        createFlashcardView.secondFactTextFeild.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(savedArticleButtonPressed))
        navigationItem.rightBarButtonItem?.isEnabled = false
       

    }
    
    @objc
    func savedArticleButtonPressed(_ sender: UIBarButtonItem) {
        
        print("saved article pressed")
        
        if question == "" || fact1 == "" || fact2 == "" {
            
              showAlert(title: "Error", message: "Fill all textFields")
            
            return
        }
    
        
        let newCard = Details(id: nil, quizTitle: question, facts: [String(fact1.dropLast(1)),String(fact2.dropFirst(1))])
    
    do {
        try dataPersistence.createItem(newCard)
    } catch {
        print("error saving article - error\(error)")
    }

        showAlert(title: "Awesome! ", message: "Your flashcard is saved!")
        reset()
       
    }
    
    
    
}

extension CreateFlashcardViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
     
       guard !(textField.text?.isEmpty ?? true) else {
           
           showAlert(title: "Error", message: "Fill all textFields")
           return
       }
       
    
        if textField.tag == 0 {
            
            if question.count < 1 {
                showAlert(title: "Error", message: "Fill all textFields")
            }

            question = textField.text ?? "no question"
            
            
        } else if textField.tag == 1 {
            
            if fact1.count < 1 {
                showAlert(title: "Error", message: "Fill all textFields")
            }
            
            
            fact1 = textField.text ?? "fact 1 "
           
        } else if textField.tag == 2 {
            
            if fact2.count < 1 {
                showAlert(title: "Error", message: "Fill all textFields")
            }
            
            
            fact2 = textField.text ?? "fact 2"
            
        }
        
        
        
    
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        navigationItem.rightBarButtonItem?.isEnabled = true
       
        return true
    }
    
   func reset() {
       
        navigationItem.rightBarButtonItem?.isEnabled = false
        createFlashcardView.questionTitleTextFeild.isEnabled = true
        createFlashcardView.questionTitleTextFeild.text = ""
    question = ""
        createFlashcardView.firstFactTextFeild.isEnabled = true
        createFlashcardView.firstFactTextFeild.text = ""
    fact1 = ""
    
        createFlashcardView.secondFactTextFeild.isEnabled = true
        createFlashcardView.secondFactTextFeild.text = ""
    fact2 = ""
    }
    
    
    
    
}

extension CreateFlashcardViewController: DataPersistenceDelegate {
    
    func didSaveItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
       
        
    }
    
    func didDeleteItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
     
    }

}
