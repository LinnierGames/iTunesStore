//
//  NetworkingStack.swift
//  iTunesStore
//
//  Created by Erick Sanchez on 5/16/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import Foundation
import Moya
import Result
import SwiftyJSON

struct NetworkingStack {
    
    private var provider = MoyaProvider<iTunesStoreAPI>()
    
    struct iTunesErrors: Error {
        private var error: String
        
        var localizedDescription: String {
            return error
        }
        
        init(_ error: String) {
            self.error = error
        }
        
        init(_ error: Error) {
            self.error = error.localizedDescription
        }
    }
    
    // MARK: - RETURN VALUES
    
    // MARK: - VOID METHODS
    
    func topMoves(with limit: Int = 25, completion: @escaping (Result<[Movie], iTunesErrors>) -> Void) {
        provider.request(.TopMovies(limit: limit)) { (result) in
            switch result {
            case .success(let response):
                do {
                    // check for any success code
                    let response = try response.filter(statusCode: 200)
                    
                    guard
                        let json = try? JSON(data: response.data),
                        let dataMovies = try? json["feed"]["entry"].rawData(),
                        let movies = try? JSONDecoder().decode([Movie].self, from: dataMovies) else {
                            assertionFailure("Failed to decode json into swift model")
                            let err = iTunesErrors("Something went wrong")
                            
                            return completion(.failure(err))
                    }
                    
                    completion(.success(movies))
                } catch {
                    assertionFailure("success code was not 200: \(response.statusCode) instead")
                    let err = iTunesErrors("Something went wrong")
                    
                    completion(.failure(err))
                }
            case .failure(let err):
                completion(.failure(iTunesErrors(err)))
            }
        }
    }
    
    // MARK: - IBACTIONS
    
    // MARK: - LIFE CYCLE
}
