//
//  MovieModel.swift
//  Marvel Movie Database App
//
//  Created by BS851 on 3/6/22.
//

import Foundation

struct MovieModel: Codable {
    let page: Int
    let results: [MovieDetailsData]
    let total_results: Int
    let total_pages: Int
}

struct MovieDetailsData: Codable {
    let original_title: String
    let overview: String
    let poster_path: String?
}
