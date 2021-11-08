//
//  NetworkManager.swift
//  MovieDB
//
//  Created by Aufa Shiddiq on 05/11/21.
//

import Foundation

final class NetworkManager {
    
    var movies: [Movie] = []
    private let domainUrlString = "https://api.themoviedb.org/3/"
    private let apiKey = "?api_key=bc5e897b0a20a7b102f692c7fecaf961"
    
    func fetchMovies(completionHandler: @escaping ([Movie]) -> Void) {
        let url = URL(string: domainUrlString + "movie/popular\(apiKey)")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      print("Error with the response, unexpected status code: \(response)")
                      return
                  }
            
            if let data = data,
               let filmSummary = try? JSONDecoder().decode(MovieResponse.self, from: data) {
                completionHandler(filmSummary.results ?? [])
            }
        })
        task.resume()
    }
    
    private func fetchDetailMovie(withID movieId:Int, completionHandler: @escaping (MovieDetail) -> Void) {
        let url = URL(string: domainUrlString + "movie/\(movieId)\(apiKey)")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error returning film id \(movieId): \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      print("Unexpected response status code: \(response)")
                      return
                  }
            
            if let data = data,
               let film = try? JSONDecoder().decode(MovieDetail.self, from: data) {
                completionHandler(film)
            }
        }
        task.resume()
    }
    
    private func fetchMovieCredit(withID movieId:Int, completionHandler: @escaping (MovieCredit) -> Void) {
        let url = URL(string: domainUrlString + "movie/\(movieId)/credits\(apiKey)")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error returning film id \(movieId): \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      print("Unexpected response status code: \(response)")
                      return
                  }
            
            if let data = data,
               let film = try? JSONDecoder().decode(MovieCredit.self, from: data) {
                completionHandler(film)
            }
        }
        task.resume()
    }
}
