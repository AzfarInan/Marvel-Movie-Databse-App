//
//  MovieData.swift
//  Marvel Movie Database App
//
//  Created by BS851 on 3/6/22.
//

import Foundation
import UIKit

struct MovieData {
    let title: String
    let detail: String
    let image: String
    let page: Int
    let total_pages: Int
    
    var getImageURL: String {
        let urlFirstPart = "https://image.tmdb.org/t/p/w500"
        return urlFirstPart + image
    }
}
