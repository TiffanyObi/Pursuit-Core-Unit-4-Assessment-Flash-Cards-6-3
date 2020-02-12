//
//  CreateFlashcardView.swift
//  Unit4Assessment
//
//  Created by Tiffany Obi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class CreateFlashcardView: UIView {
    
    public lazy var directionLabel: UILabel = {
        let label = UILabel()
        label.text = "Give your flashcard a name and 2 facts"
        label.font = UIFont(name: "Didot", size: 35)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var questionTitleTextFeild: UITextField = {
        let textFeild = UITextField()
         textFeild.font = UIFont(name: "Didot", size: 25)
        textFeild.tag = 0
        
        
        textFeild.placeholder = "Question Title"
        
        return textFeild
    }()
    
    public lazy var firstFactTextFeild: UITextField = {
        let textFeild = UITextField()
        textFeild.font = UIFont(name: "Didot", size: 20)
        textFeild.tag = 1
        
        textFeild.textAlignment = .center
        textFeild.placeholder = "Fact 1 Here"
        
        return textFeild
    }()
    
    public lazy var secondFactTextFeild: UITextField = {
        let textFeild = UITextField()
          textFeild.font = UIFont(name: "Didot", size: 20)
        textFeild.tag = 2
        
        textFeild.textAlignment = .center
        textFeild.placeholder = "Fact 2 Here"
        
        return textFeild
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame:UIScreen.main.bounds)
        commomInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        commomInit()
    }
    
    private func commomInit() {
        setupDirectionLabelContstaints()
        setupQuestionTextViewContstaints()
        setupFirstFactTextViewContstaints()
        setupSecondFactTextViewContstaints()
    }
    
    private func setupDirectionLabelContstaints() {
        addSubview(directionLabel)
        directionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            directionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor), directionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            directionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20)
            
        ])
    }
    
    private func setupQuestionTextViewContstaints() {
        addSubview(questionTitleTextFeild)
        questionTitleTextFeild.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            questionTitleTextFeild.topAnchor.constraint(equalTo: directionLabel.bottomAnchor, constant: 40),
            questionTitleTextFeild.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            questionTitleTextFeild.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            
        ])
    }
    
    private func setupFirstFactTextViewContstaints() {
        addSubview(firstFactTextFeild)
        firstFactTextFeild.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstFactTextFeild.topAnchor.constraint(equalTo: questionTitleTextFeild.bottomAnchor, constant: 100),
            firstFactTextFeild.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            firstFactTextFeild.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            
        ])
    }
    
    private func setupSecondFactTextViewContstaints() {
        addSubview(secondFactTextFeild)
        secondFactTextFeild.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            secondFactTextFeild.topAnchor.constraint(equalTo: firstFactTextFeild.bottomAnchor, constant: 100),
            secondFactTextFeild.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            secondFactTextFeild.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            
        ])
    }
}
