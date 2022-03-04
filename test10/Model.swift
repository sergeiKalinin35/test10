//
//  Model.swift
//  test10
//
//  Created by Sergey on 04.03.2022.
//

import Foundation

struct MovieResults: Codable {
    
    var results:[Movie]
}
struct Movie: Codable {
    var id: Int?
    var title: String?
    var name: String?
    var original_language: String?
    var genre_ids: [Int]?
    var first_air_date: String?
    var original_name: String?
    var original_title: String?
    var overview: String?
    var poster_path: String?
    var backdrop_path: String?
    var popularity: Double?
    var vote_average: Double?
    var vote_count: Int?
    var adult: Bool?
    var release_date: String?
    var posterPath: String {
        if let path = poster_path {
            return "https://image.tmdb.org/t/p/original/\(path)"
        } else {
            return""
        }
    }
    var voteAverage: Double {
        if let avg = vote_average {
            return avg / 10.0
            }
        return 0.0
    }
    var titleWithLanguage: String {
        guard let title = title, let lang = original_language else { return ""}
        return "\(title)(\(lang))"
        
    }
    
}


struct API {
    
    //https://api.themoviedb.org/3/movie/{movie_id}?api_key=224b97812868b2d6c6ec57f80f7affea
    var baseURL = "https://api.themoviedb.org/3/movie/"
    var key = "224b97812868b2d6c6ec57f80f7affea"
}
       


struct APIMovie: Codable {
    let adult: Bool?
    let backdrop_path: String?
    let budget: Int?
    let genres: [Genre]
    let homepage: String?
    let id: Int?
    let imdb_id, original_language, original_title, overview: String?
    let popularity: Double?
    let poster_path: String?
    let release_date: String?
    let revenue, runtime: Int?
    let status, tagline, title: String?
    let vote_average: Double?
    let vote_count: Int?
    var posterPath: String {
        if let path = poster_path {
            return "https://image.tmdb.org/t/p/original/\(path)"
        } else {
            return""
        }
}
}

struct Genre: Codable {
    let id: Int
    let name: String
}


struct CastResponse: Codable {
    var cast: [Cast]
    
}

struct Cast: Codable {
    var id: Int?
    var name: String?
    var character: String?
    var profile_path: String?
    var profilePhoto: String {
        if let path = profile_path {
            return "https://image.tmdb.org/t/p/original/\(path)"
            
        }
        return "https://picsum.photos/200/300"
    }
}





