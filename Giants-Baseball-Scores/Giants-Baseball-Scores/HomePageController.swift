//
//  HomePageController.swift
//  Giants-Baseball-Scores
//
//  Created by Joe Veverka on 7/27/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit



class HomePageController {
    
    //MARK: - Properties
    
    var scheduledGames: Schedule?
    
    private var baseURL = URL(string: "https://api.sportsdata.io/v3/mlb/scores/json/Games/2020")!
    
    private lazy var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(HomePageController.dateFormatter)
        return decoder
    }()
    
    static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter
    }
    
    func fetchGiantsSchedule(completion: @escaping (Result<[Schedule], NetworkError>) -> Void) {
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue("e858b807cfa14840b026e5dc9f6f21a1", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let response = response {
                print(response)
            }
            
            if let error = error {
                print("Error decoding schedule: \(error)")
                return
            }
            
            guard let data = data else {
                
                completion(.failure(.noData))
                return
            }
            print(data)
            
            do {
                let schedule = try self.jsonDecoder.decode([Schedule].self, from: data)
                
                // Somewhere that the user has specified which day to look for
                
                
                
                completion(.success(schedule))
            } catch {
                print("Error decoding Schedule: \(error)")
                completion(.failure(.badDecode))
                
            }
            
        }.resume()
    }
}


