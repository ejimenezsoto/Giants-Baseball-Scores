//
//  HomePageController.swift
//  Giants-Baseball-Scores
//
//  Created by Joe Veverka on 7/27/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import Foundation

// HTTP Method handling
enum HTTPMethod: String {
    case get = "GET"
}

// Error handling
enum NetworkError: Error {
    case noData, badDecode
}

class HomePageController {
    
    //MARK: - Properties
    
    var games: [Game] = []
    
    private lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    /// URL Properties
    private let baseURL = URL(string: "https://api.sportsdata.io/v3/mlb/scores/json")!
    private lazy var stadiumURL = baseURL.appendingPathComponent("/Stadiums?key=e858b807cfa14840b026e5dc9f6f21a1")
    private lazy var standingsURL = baseURL.appendingPathComponent("/Standings/2020")
    
    /// We will need to create a date range for this endpoint. date format on API is YYYY-MMM-DD
    private lazy var gamesURL = baseURL.appendingPathComponent("/GamesByDate/")
    
    
    //MARK: - Fetch Games
    
    func fetchGamesInfo(completion: @escaping (Result<[Game], NetworkError>) -> Void) {
        
        var request = URLRequest(url: gamesURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let response = response as? HTTPURLResponse,
                response.statusCode == 401 {
                completion(.failure(.badDecode))
                return
            }
            
            if let error = error {
                print("Error fetching Giants data: \(error)")
                completion(.failure(.badDecode))
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let games = try self.jsonDecoder.decode([Game].self, from: data)
                completion(.success(games))
                
            } catch {
                print("Error decoding games: \(error)")
                completion(.failure(.badDecode))
            }
            
        }.resume()
    }
    
    func fetchStadiumInfo(completion: @escaping (Result<[Stadium], NetworkError>) -> Void) {
        
        var request = URLRequest(url: stadiumURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let response = response as? HTTPURLResponse,
                response.statusCode == 401 {
                completion(.failure(.badDecode))
                return
            }
            
            if let error = error {
                print("Error fetching Giants data: \(error)")
                completion(.failure(.badDecode))
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let stadiums = try self.jsonDecoder.decode([Stadium].self, from: data)
                completion(.success(stadiums))
                
            } catch {
                print("Error decoding stadiums: \(error)")
                completion(.failure(.badDecode))
            }
            
        }.resume()
    }
    
    func fetchStandingsInfo(completion: @escaping (Result<[Standing], NetworkError>) -> Void) {
        
        var request = URLRequest(url: standingsURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let response = response as? HTTPURLResponse,
                response.statusCode == 401 {
                completion(.failure(.badDecode))
                return
            }
            
            if let error = error {
                print("Error fetching Giants Standings: \(error)")
                completion(.failure(.badDecode))
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let standings = try self.jsonDecoder.decode([Standing].self, from: data)
                completion(.success(standings))
                
            } catch {
                print("Error decoding Giants Standings: \(error)")
                completion(.failure(.badDecode))
            }
            
        }.resume()
    }
}
