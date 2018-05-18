//
//  Movie.swift
//  iTunesStore
//
//  Created by Erick Sanchez on 5/16/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Movie: Decodable, CustomStringConvertible {
    
    private var _title: Label<String>
    
    /** movie title */
    var title: String {
        return self._title.label
    }
    
    private var _releaseDate: Label<String>
    
    /** movie release date */
    var releaseDate: Date {
        let dateString = self._releaseDate.label
        
        return ISO8601DateFormatter().date(from: dateString)!
    }
    
    private var _price: Label<String>
    
    /** movie price */
    var price: String {
        return self._price.label
    }
    private enum Images: Int {
        case Thumbnail
        case Thumbnail2
        case Comp
    }
    private var _image: [Label<URL>]
    
    /** movie thumb Url */
    var thumbnailUrl: URL {
        return self._image[Images.Thumbnail.rawValue].label
    }
    
    /** movie header Url */
    var compUrl: URL {
        return self._image[Images.Comp.rawValue].label
    }
    
    private var _storeUrl: JSON
    
    /** movie iTunes Url */
    var storeUrl: URL {
        guard
            let stringUrl = self._storeUrl[0]["attributes"]["href"].string,
            let url = URL(string: stringUrl) else {
                fatalError("Failed to decode url from JSON \(self._storeUrl)")
        }
        
        return url
    }
    
    enum CodingKeys: String, CodingKey {
        case _title = "im:name"
        case _releaseDate = "im:releaseDate"
        case _price = "im:price"
        case _image = "im:image"
        case _storeUrl = "link"
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
