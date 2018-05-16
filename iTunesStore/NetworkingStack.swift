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
    
    func topMoves(with limit: Int = 25, completion: @escaping (Result<[Any], iTunesErrors>) -> Void) {
        provider.request(.TopMovies(limit: limit)) { (result) in
            switch result {
            case .success(let response):
                break
            case .failure(let err):
                completion(.failure(iTunesErrors(err)))
            }
        }
    }
    
    // MARK: - IBACTIONS
    
    // MARK: - LIFE CYCLE
}
