//
//  HomePageController.swift
//  Giants-Baseball-Scores
//
//  Created by Joe Veverka on 7/27/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class GameController {
    
    //MARK: - Properties
    
    var scheduledGame: Game?
    
    private var baseURL = URL(string: "https://api.sportsdata.io/v3/mlb/scores/json/Games/2020")!
    
    
    func fetchGiantsSchedule(completion: @escaping (Result<[Game], NetworkError>) -> Void) {
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue("e858b807cfa14840b026e5dc9f6f21a1", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            //Dat response
            if let response = response {
                print(response)
            }
            
            //Dat error
            if let error = error {
                
                print("Error decoding schedule: \(error)")
                return
                
            }
            
            //Dat Dat
            guard let data = data else {
                
                completion(.failure(.noData))
                return
                
            }
            
            //Do This Please. 
            do {
                
                let games = try self.jsonDecoder.decode([Game].self, from: data)
                let giantsHomeGames = games.filter { $0.homeTeamName == "SF" }
                let giantsAwayGames = games.filter { $0.awayTeamName == "SF" }
                
                let allGiantsGames = giantsAwayGames + giantsHomeGames
                
                
                //                print(giantsGames)
                
                completion(.success(allGiantsGames))
                
            } catch {
                
                print("Error decoding Schedule: \(error)")
                completion(.failure(.badDecode))
                
            }
            
        }.resume()
    }
    
    private lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(GameController.dateFormatter)
        return decoder
    }()
    
    static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter
    }
}

