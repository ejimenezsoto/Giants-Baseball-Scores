//
//  Game.swift
//  Giants-Baseball-Scores
//
//  Created by Joe Veverka on 7/27/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import Foundation


//MARK:  https://api.sportsdata.io/v3/mlb/scores/json/Games/2020

struct Game: Decodable {
    
    // Properties
    var day: String
    var homeTeamName: String
    var awayTeamName: String
    var homeTeamRuns: Int?
    var awayTeamRuns: Int?
//    var stadium: Stadium?
    
    private enum ScheduleCodingKeys: String, CodingKey {
        case day = "Day"
        case homeTeamName = "HomeTeam"
        case awayTeamName = "AwayTeam"
        case stadium = "StadiumID"
        case homeTeamRuns = "HomeTeamRuns"
        case awayTeamRuns = "AwayTeamRuns"
    }

    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: ScheduleCodingKeys.self)
        let Day = try container.decode(String.self, forKey: .day)
        let HomeTeam = try container.decode(String.self, forKey: .homeTeamName)
        let AwayTeam = try container.decode(String.self, forKey: .awayTeamName)
        let HomeTeamRuns = try container.decodeIfPresent(Int.self, forKey: .homeTeamRuns)
        let AwayTeamRuns = try container.decodeIfPresent(Int.self, forKey: .awayTeamRuns)
        
        self.day = Day
        self.homeTeamName = HomeTeam
        self.awayTeamName = AwayTeam
        self.homeTeamRuns = HomeTeamRuns
        self.awayTeamRuns = AwayTeamRuns
  
    }
}

