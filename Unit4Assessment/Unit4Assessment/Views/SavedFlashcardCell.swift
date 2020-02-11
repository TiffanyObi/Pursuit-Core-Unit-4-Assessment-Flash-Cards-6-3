//
//  SavedFlashcardCell.swift
//  Unit4Assessment
//
//  Created by Tiffany Obi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit


class SavedFlashcardCell: UICollectionViewCell {
    
    public lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Question"
        return label
    }()
    
    public lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        
        // how do we set up a button programatically? (addTarget)
        button.addTarget(self, action: #selector(moreButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    

    public lazy var answerTextfeild: UITextView = {
        let textView = UITextView()
       
        textView.font = UIFont.preferredFont(forTextStyle: .headline)
        textView.text = "Answers to the question"
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
    }
    
    @objc private func moreButtonPressed(_ sender: UIButton) {
           
        
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
    
    public func congifureCell(){
        questionLabel.text = "Questions here"
    }
    
}
