//
//  FlashCard.swift
//  Unit4Assessment
//
//  Created by Tiffany Obi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

//struct SearchResult: Codable & Equatable{
//
//    let cards: [Details]
//
//}

struct Details: Codable & Equatable{
    let id: String?
    let quizTitle: String
    let facts: [String]
}

extension Details { // extension on the struct
    
   
    
    static func getFlashcards() -> [Details] {
        
        var flashcards = [Details]()
    
        guard let fileURL = Bundle.main.url(forResource: "flashcardsData", withExtension: "json") else {
            fatalError("Could not locate json file")
        }
        
        
        do {
            let data = try Data(contentsOf: fileURL)
             //parse data to our Swift [NewsHeadline]
            
            let cards = try JSONDecoder().decode([Details].self, from: data)
            
            flashcards = cards
            
        } catch {
        fatalError(" failed to load contents \(error) ")
        }
        
        return flashcards
    }
}

