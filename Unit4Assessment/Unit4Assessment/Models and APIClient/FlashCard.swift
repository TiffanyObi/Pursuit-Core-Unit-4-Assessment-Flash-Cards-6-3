//
//  FlashCard.swift
//  Unit4Assessment
//
//  Created by Tiffany Obi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

struct SearchResult: Codable & Equatable{
    
    let cards: [Details]
    
}

struct Details: Codable & Equatable{
    let id: String
    let cardTitle: String
    let facts: [String]
}


struct CreatedFlashCard: Codable & Equatable {
    let question: String
    let answer: String
    
}
