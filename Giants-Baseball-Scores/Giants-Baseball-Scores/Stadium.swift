//
//  Stadium.swift
//  Giants-Baseball-Scores
//
//  Created by Joe Veverka on 7/27/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

//MARK: - LINK:  https://api.sportsdata.io/v3/mlb/scores/json/Stadiums

import Foundation

struct Stadium: Encodable, Decodable {
    
    var name: String
    var city: String
    var state: String
    var stadiumID: Int32
    var geoLat: Double
    var geoLong: Double
    
    enum StadiumCodingKeys: String, CodingKey {
        case Name, City, State, StadiumID, GeoLat, GeoLong
    }
    
    init(from decoder: Decoder) throws {
           
           let container = try decoder.container(keyedBy: StadiumCodingKeys.self)
           let name = try container.decode(String.self, forKey: .Name)
           let city = try container.decode(String.self, forKey: .City)
           let state = try container.decode(String.self, forKey: .State)
           let stadiumID = try container.decode(Int32.self, forKey: .StadiumID)
           let geoLat = try container.decode(Double.self, forKey: .GeoLat)
           let geoLong = try container.decode(Double.self, forKey: .GeoLong)
        
           
        self.name = name
        self.city = city
        self.state = state
        self.stadiumID = stadiumID
        self.geoLat = geoLat
        self.geoLong = geoLong
           
       }
}
