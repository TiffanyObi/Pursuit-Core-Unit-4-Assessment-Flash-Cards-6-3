//
//  SearchFlashcardCell.swift
//  Unit4Assessment
//
//  Created by Tiffany Obi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

protocol AddNewCardDelegate: AnyObject {

    func didSaveFlashcard(_ flashcard: Details)
}


class SearchFlashcardCell: UICollectionViewCell {
    
    weak var delegate: AddNewCardDelegate?
    
    private var currentFlashcard: Details!
    
    public lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Question"
        return label
    }()
    
    public lazy var answerTextfeild: UITextView = {
        let textView = UITextView()
       
        textView.font = UIFont.preferredFont(forTextStyle: .headline)
        textView.text = "Answers to the question"
        return textView
    }()
    
    public lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.down.on.square.fill"), for: .normal)
        
        
        button.addTarget(self, action: #selector(addButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        commomInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        commomInit()
    }
    
    private func commomInit() {
        setUpAddButtonConstraints()
        setUpQuestionLabelConstraints()
}
    
    @objc private func addButtonPressed(_ sender: UIButton) {
        print("addbutton pressed")
        delegate?.didSaveFlashcard(currentFlashcard)
          }
    
    private func setUpAddButtonConstraints(){
        addSubview(addButton)
       addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: topAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 60),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor)
        
        ])
    }
    
    private func setUpQuestionLabelConstraints(){
        addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            questionLabel.topAnchor.constraint(equalTo: addButton.bottomAnchor),
           questionLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
    }
    
    public func configureCell(for flashcard: Details) {
        currentFlashcard = flashcard
        questionLabel.text = flashcard.quizTitle
        answerTextfeild.text = flashcard.facts.description
    }

}
