//
//  SearchFlashcardsAPIClient.swift
//  Unit4Assessment
//
//  Created by Tiffany Obi on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation
import NetworkHelper

struct SearchFlashcardsAPIClient {
    
  static func fetchTopStories(completion: @escaping (Result<[Details], AppError>) -> ()) {
    
    
    
    let endpointURLstring = "https://5daf8b36f2946f001481d81c.mockapi.io/api/v2/cards"
    
    guard let url = URL(string: endpointURLstring) else {
      completion(.failure(.badURL(endpointURLstring)))
      return
    }
    let request = URLRequest(url: url)
    
    NetworkHelper.shared.performDataTask(with: request) { (result) in
      switch result {
      case .failure(let appError):
        completion(.failure(.networkClientError(appError)))
      case .success(let data):
        do {
          let cards = try JSONDecoder().decode(SearchResult.self, from: data)
            completion(.success(cards.cards))
        } catch {
          completion(.failure(.decodingError(error)))
      }
    }
  }
}
}
