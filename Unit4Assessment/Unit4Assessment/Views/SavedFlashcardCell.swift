//
//  SavedFlashcardCell.swift
//  Unit4Assessment
//
//  Created by Tiffany Obi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

protocol SavedFlashCardDelegate: AnyObject {
    
    
    func didSelectMoreButton(flashCard: Details)
}



class SavedFlashcardCell: UICollectionViewCell {
    
   
   
     var isShowingAnswer = false
    
    weak var delegate: SavedFlashCardDelegate?
    
    private var currentCard: Details!

    public lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Question"
        return label
    }()
    
    private lazy var longPressGesture: UILongPressGestureRecognizer = {
        let longPress = UILongPressGestureRecognizer()
        longPress.addTarget(self, action: #selector(didLongPress(_:)))
        return longPress
    }()
    
    
    public lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        
        // how do we set up a button programatically? (addTarget)
        button.addTarget(self, action: #selector(moreButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    

    public lazy var answerTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: .headline)
        textView.text = "Answers to the question"
        textView.isEditable = false
        textView.isSelectable = false
        textView.textAlignment = .center
        textView.backgroundColor = .systemGreen
        return textView
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
        setUpMoreButtonConstraints()
        setUpQuestionLabelConstraints()
        setUpAnswerTextViewConstraints()
        animate()
        
        addGestureRecognizer(longPressGesture)
    }
    
    @objc private func moreButtonPressed(_ sender: UIButton) {
    
           
        delegate?.didSelectMoreButton(flashCard: currentCard)
        
       }


    @objc private func didLongPress(_ gesture: UILongPressGestureRecognizer) {
        
        if gesture.state == .began {
            gesture.state = .ended
            
             isShowingAnswer.toggle()
        }
        animate()
        
       
    }
   
    
    
    
    private func animate() {
        
        let duration : Double = 1.0
        
       
        
        if isShowingAnswer == true {
            
            UIView.transition(with: self, duration: duration, options: [.transitionFlipFromRight], animations: {
                
               self.answerTextView.alpha = 1
               self.questionLabel.alpha = 0
               
              
                            }, completion: nil)
            
          
            
        } else if isShowingAnswer == false {
            
            UIView.transition(with: self, duration: duration, options: [.transitionFlipFromLeft], animations: {
                
                self.answerTextView.alpha = 0
                self.questionLabel.alpha = 1
                
              
               
            }, completion: nil)
            
            
        }
        
      
    }
    
    private func setUpMoreButtonConstraints() {
        addSubview(moreButton)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([ moreButton.topAnchor.constraint(equalTo: topAnchor),
            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            moreButton.heightAnchor.constraint(equalToConstant: 60),
            moreButton.widthAnchor.constraint(equalTo: moreButton.heightAnchor)
        ])
    }
    
    private func setUpQuestionLabelConstraints(){
        addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            questionLabel.topAnchor.constraint(equalTo: moreButton.bottomAnchor),
           questionLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
    }
    
    private func setUpAnswerTextViewConstraints(){
           addSubview(answerTextView)
           answerTextView.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               answerTextView.leadingAnchor.constraint(equalTo: leadingAnchor),
              answerTextView.trailingAnchor.constraint(equalTo: trailingAnchor),
               answerTextView.topAnchor.constraint(equalTo: moreButton.bottomAnchor),
             answerTextView.bottomAnchor.constraint(equalTo: bottomAnchor)
           
           ])
       }
    
    public func configureCell(for flashcard: Details){
        
        currentCard = flashcard
        
        questionLabel.text = flashcard.quizTitle
        answerTextView.text = String(flashcard.facts.description.dropFirst(2).dropLast(2))
    }
    
}
