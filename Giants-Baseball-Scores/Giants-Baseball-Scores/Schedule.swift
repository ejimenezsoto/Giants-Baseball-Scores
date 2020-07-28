//
//  Game.swift
//  Giants-Baseball-Scores
//
//  Created by Joe Veverka on 7/27/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import Foundation


//MARK:  https://api.sportsdata.io/v3/mlb/scores/json/Games/2020

struct Schedule: Decodable {
    // Properties
    var datetime: String
    var homeTeamName: String
    var awayTeamName: String
    var homeTeamRuns: Int?
    var awayTeamRuns: Int?
    var stadium: Stadium?
    
    private enum ScheduleCodingKeys: String, CodingKey {
        case DateTime, HomeTeam, AwayTeam, StadiumID, HomeTeamRuns, AwayTeamRuns
        
    }

    init(from decoder: Decoder, datetime: Date) throws {
        
        let container = try decoder.container(keyedBy: ScheduleCodingKeys.self)
        let datetime = try container.decode(String.self, forKey: .DateTime)
        let HomeTeam = try container.decode(String.self, forKey: .HomeTeam)
        let AwayTeam = try container.decode(String.self, forKey: .AwayTeam)
        let HomeTeamRuns = try container.decode(Int.self, forKey: .HomeTeamRuns)
        let AwayTeamRuns = try container.decode(Int.self, forKey: .AwayTeamRuns)
        
        
        self.datetime = datetime
        self.homeTeamName = HomeTeam
        self.awayTeamName = AwayTeam
        self.homeTeamRuns = HomeTeamRuns
        self.awayTeamRuns = AwayTeamRuns
  
    }
}

struct Stadium: Decodable {
    
    var name: String
    var city: String
    var state: String
    var geoLat: Double
    var geoLong: Double
    
    enum StadiumCodingKeys: String, CodingKey {
        case Name, City, State, GeoLat, GeoLong
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StadiumCodingKeys.self)
        let name = try container.decode(String.self, forKey: .Name)
        let city = try container.decode(String.self, forKey: .City)
        let state = try container.decode(String.self, forKey: .State)
        let geoLat = try container.decode(Double.self, forKey: .GeoLat)
        let geoLong = try container.decode(Double.self, forKey: .GeoLong)
        
        self.name = name
        self.city = city
        self.state = state
        self.geoLat = geoLat
        self.geoLong = geoLong
    }
}

