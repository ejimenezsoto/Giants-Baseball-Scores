//
//  Stadium.swift
//  Giants-Baseball-Scores
//
//  Created by Enzo Jimenez-Soto on 7/29/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import Foundation

struct Stadiums {
    
    var name: String
    var teamAbrv: String
    var geoLat: Double
    var geoLong: Double
    
    
    init(name: String,teamAbrv: String, geoLat: Double, geoLong: Double) {
        self.name = name
        self.teamAbrv = teamAbrv
       
        self.geoLat = geoLat
        self.geoLong = geoLong
    }
}

 let sanFransiscoGiants = Stadiums(name: "Oracle Park Stadium", teamAbrv: "SF", geoLat: 37.778473, geoLong: 122.389595)

let losAngelesDodgers = Stadiums(name: "Dodger Stadium", teamAbrv: "LAD", geoLat: 34.072724, geoLong: -118.240646)
 
let sanDiegoPadres = Stadiums(name: "PETCO Park", teamAbrv: "SD", geoLat: 32.707710, geoLong: -117.157097)

let texasRangers = Stadiums(name: "Globe Life Field", teamAbrv: "TEX", geoLat: 32.747361, geoLong: -97.084167)

let coloradoRockies = Stadiums(name: "Coors Field", teamAbrv: "COL", geoLat: 39.755891, geoLong: -104.994198)

let houstonAstros = Stadiums(name: "Minute Maid Park", teamAbrv: "HOU", geoLat: 29.756965, geoLong: -95.354824)

let oaklandAthletic = Stadiums(name: "Oakland Coliseum", teamAbrv: "OAK", geoLat: 37.751605, geoLong: -122.200523)

let losAngelesAngels = Stadiums(name: "Angel Stadium of Anaheim", teamAbrv: "LAA", geoLat: 33.799925, geoLong: -117.883194)

let arizonaDiamondbacks = Stadiums(name: "Chase Field", teamAbrv: "ARI", geoLat: 33.445526, geoLong: -112.066721)

let seattleMariners = Stadiums(name: "T-Mobile Park", teamAbrv: "SEA", geoLat: 47.591358, geoLong: -122.332283)
