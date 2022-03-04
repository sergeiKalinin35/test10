//
//  NetworkManagar.swift
//  test10
//
//  Created by Sergey on 04.03.2022.
//

import Foundation



class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    // "https://api.themoviedb.org/3/movie/\(movie.id ?? 100)/credits?api_key=\(API.key)
    //    func fetchDataMovie(from urlString: String, with completion: @escaping (TitleResults) -> Void) {
    func fetchDataMovie(with completion: @escaping (CastResponse) -> Void) {
        // guard let url = URL(string: urlString) else { return }
        guard let url = URL(
            string: "https://api.themoviedb.org/3/movie/124/credits?api_key=224b97812868b2d6c6ec57f80f7affea")
        else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let results = try JSONDecoder().decode(CastResponse.self, from: data)
                
                DispatchQueue.main.async {
                    completion(results)
                }
                
            } catch let error {
                print(error)
            }
            
        } .resume()
        
    }

}




