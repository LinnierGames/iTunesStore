//
//  Movie.swift
//  iTunesStore
//
//  Created by Erick Sanchez on 5/16/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import Foundation

struct Movie: Decodable, CustomStringConvertible {
    
    private var _title: Label<String>
    var title: String {
        return self._title.label
    }
    
    private var _releaseDate: Label<String>
    var releaseDate: Date {
        let dateString = self._releaseDate.label
        
        return ISO8601DateFormatter().date(from: dateString)!
    }
    
    private var _price: Label<String>
    var price: String {
        return self._price.label
    }
    
    enum CodingKeys: String, CodingKey {
        case _title = "im:name"
        case _releaseDate = "im:releaseDate"
        case _price = "im:price"
    }
    
    private struct Label<T>: Decodable where T: Decodable {
        var label: T
        
        enum CodingKeys: String, CodingKey {
            case label
        }
    }
    
    var description: String {
        return "\(self.title) \(self.price) - Released on \(self.releaseDate)"
    }
}