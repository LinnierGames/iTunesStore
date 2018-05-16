//
//  iTunesApi.swift
//  iTunesStore
//
//  Created by Erick Sanchez on 5/16/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import Foundation
import Moya

enum iTunesStoreAPI {
    case TopMovies(limit: Int)
}

extension iTunesStoreAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://itunes.apple.com/")!
    }
    
    var path: String {
        switch self {
        case .TopMovies(limit: let limit):
            return "us/rss/topmovies/limit=\(limit)/json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .TopMovies:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .TopMovies:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
