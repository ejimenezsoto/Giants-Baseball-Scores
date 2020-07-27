//
//  Game.swift
//  Giants-Baseball-Scores
//
//  Created by Joe Veverka on 7/27/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import Foundation


//MARK:  https://api.sportsdata.io/v3/mlb/scores/json/GamesByDate/{date}

struct Game: Decodable, Encodable {
    
    var day: Date
    var gameID: Int32
    var season: Int32
    var homeTeam: String
    var awayTeam: String
    var stadiumID: Int32
    var homeTeamRuns: Int32
    var awayTeamRuns: Int32
    
    
    enum GameCodingKeys: String, CodingKey {
        case Day, GameID, Season, HomeTeam, AwayTeam, StadiumID, HomeTeamRuns, AwayTeamRuns
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: GameCodingKeys.self)
        let day = try container.decode(Date.self, forKey: .Day)
        let gameID = try container.decode(Int32.self, forKey: .GameID)
        let season = try container.decode(Int32.self, forKey: .Season)
        let homeTeam = try container.decode(String.self, forKey: .HomeTeam)
        let awayTeam = try container.decode(String.self, forKey: .AwayTeam)
        let stadiumID = try container.decode(Int32.self, forKey: .StadiumID)
        let homeTeamRuns = try container.decode(Int32.self, forKey: .HomeTeamRuns)
        let awayTeamRuns = try container.decode(Int32.self, forKey: .AwayTeamRuns)
        
        self.day = day
        self.gameID = gameID
        self.season = season
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.stadiumID = stadiumID
        self.homeTeamRuns = homeTeamRuns
        self.awayTeamRuns = awayTeamRuns
        
    }
}
