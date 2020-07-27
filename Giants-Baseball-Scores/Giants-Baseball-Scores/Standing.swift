//
//  Standing.swift
//  Giants-Baseball-Scores
//
//  Created by Joe Veverka on 7/27/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

//MARK: - LINK: https://api.sportsdata.io/v3/mlb/scores/json/Standings/{season}

import Foundation

struct Standing: Encodable, Decodable {
    
    var season: Int32
    var teamID: Int32
    var wins: Int32
    var losses: Int32
    
    enum StandingCodingKeys: String, CodingKey {
        case Season, TeamID, Wins, Losses
    }
    
    init(with decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StandingCodingKeys.self)
        let season = try container.decode(Int32.self, forKey: .Season)
        let teamID = try container.decode(Int32.self, forKey: .TeamID)
        let wins = try container.decode(Int32.self, forKey: .Wins)
        let losses = try container.decode(Int32.self, forKey: .Losses)
        
        self.season = season
        self.teamID = teamID
        self.wins = wins
        self.losses = losses
    }
}
