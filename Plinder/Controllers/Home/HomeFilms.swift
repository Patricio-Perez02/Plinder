//
//  HomeFilms.swift
//  Plinder
//
//  Created by Patricio Perez on 31/07/2020.
//  Copyright © 2020 Patricio Perez. All rights reserved.
//

import Foundation

struct HomeFilms: Codable {
    let page, totalResults, totalPages: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let popularity: Double
    let id: Int
    let video: Bool
    let voteCount: Int
    let voteAverage: Double
    let title, releaseDate: String
    let originalLanguage: OriginalLanguage
    let originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String?
    let adult: Bool
    let overview, posterPath: String

    enum CodingKeys: String, CodingKey {
        case popularity, id, video
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case title
        case releaseDate = "release_date"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case posterPath = "poster_path"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ru = "ru"
    case te = "te"
}
