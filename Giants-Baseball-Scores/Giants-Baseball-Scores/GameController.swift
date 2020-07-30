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
    
    var gotDamnGiantsGames: [Game] = []
    
    private var baseURL = URL(string: "https://api.sportsdata.io/v3/mlb/scores/json/Games/2020")!
    
    func fetchGiantsSchedule(completion: @escaping (Result<[Game], NetworkError>) -> Void) {
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue("c750504d0e8049bc94816da5c6cf769c", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        
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
                
                
                let aDate = Dates.dateFromString("2020-07-23T22:00:00")
                let bDate = Dates.dateFromString("2020-09-23T21:00:00")
                let datesString = Dates.printDatesBetweenInterval(aDate, bDate) // <--- this prints out every date between the first and last game on the API
//                print(datesString)
                
                
                let games = try self.jsonDecoder.decode([Game].self, from: data)
                let giantsHomeGames = games.filter {$0.homeTeamName == "SF" }
                let giantsAwayGames = games.filter { $0.awayTeamName == "SF" }
                let allGiantsGames = giantsAwayGames + giantsHomeGames
                
                self.gotDamnGiantsGames.removeAll()
                self.gotDamnGiantsGames.append(contentsOf: allGiantsGames)
//                print(allGiantsGames)
                
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

//MARK: - Not doing anything with this yet. An attempt be able to utilize date ranges in the json.
class Dates {
    
    static func dateFromString(_ dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        return dateFormatter.date(from: dateString)!
    }
    
    static func printDatesBetweenInterval(_ startDate: Date, _ endDate: Date) -> String {
        
        var startDate = startDate
        let calendar = Calendar.current
        var somethin = "["
        
        var dateFormatter: DateFormatter {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            return dateFormatter
        }
        
        while startDate <= endDate {
            if startDate < endDate {
                somethin.append("\"\(dateFormatter.string(from: startDate))\", ")
            } else {
                somethin.append("\"\(dateFormatter.string(from: startDate))\"")
            }
            startDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        }
        somethin.append("]")
        return somethin
    }
}

