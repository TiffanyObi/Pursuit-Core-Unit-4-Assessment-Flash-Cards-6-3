//
//  Unit4AssessmentTests.swift
//  Unit4AssessmentTests
//
//  Created by Alex Paul on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import XCTest
import NetworkHelper
@testable import Unit4Assessment

class Unit4AssessmentTests: XCTestCase {

   func testBookTopicSearch() {
       
       
       let exp = XCTestExpectation(description: "search found") //need this
       
     let nYTimesEndpoint = "https://5daf8b36f2946f001481d81c.mockapi.io/api/v2/cards"
       
       let request = URLRequest(url: URL(string: nYTimesEndpoint)!)
       
       //act
       NetworkHelper.shared.performDataTask(with: request) { (result) in
           
           switch result {
               
           case .failure(let appError):
               XCTFail("appError: \(appError)")
               
           case .success(let data):
               exp.fulfill() //need this
               //assert
               XCTAssertGreaterThan(data.count, 17_000, "dataCount \(data.count) should be greater than 17,000")
               
           }
       }
       
       wait(for: [exp], timeout: 5.0) // wait for 5 seconds. //need this
   }
    
        func testcheckApiForModel() {
            
            struct SearchResult: Codable {
                    
                    let cards: [Details]
                    
                }
                struct Details: Codable {
                    let id: String
                    let cardTitle: String
                    let facts: [String]
                }
            
       let json = """
    {
        "cardListType": "q and a",
        "apiVersion": "1.2.3",
        "cards": [{
                "id": "1",
                "cardTitle": "What is the difference between a synchronous & an asynchronous task?",
                "facts": [
                    "Synchronous: waits until the task have completed.",
                    "Asynchronous: completes a task in the background and can notify you when complete."
                ]
            },
            {
                "id": "2",
                "cardTitle": "What is an Enum?",
                "facts": [
                    "contains a group of related values.",
                    "enumerations define a finite number of states, and can bundle associated values with each individual state.",
                    "you can use them to model the state of your app and its internal processes."
                ]
            },
            {
                "id": "3",
                "cardTitle": "What’s the difference between the frame and the bounds?",
                "facts": [
                    "The frame of a UIView is the rectangle, expressed as a location (x,y) and size (width,height) relative to the superview it is contained within.",
                    "The bounds of a UIView is the rectangle, expressed as a location (x,y) and size (width,height) relative to its own coordinate system (0,0)."
                ]
            },
            {
                "id": "4",
                "cardTitle": "How does Quick Sort work?",
                "facts": [
                    "Uses divide and conquer and splits the array into three parts based on a pivot variable.",
                    "Picks an element as pivot and partitions the given array around the picked pivot."
                ]
            }
        ]
    }
    """.data(using: .utf8)!
            
                let cards = try! JSONDecoder().decode(SearchResult.self, from: json)
                
                // assert
            XCTAssertEqual(cards.cards.count, 4)


    }

    

}
