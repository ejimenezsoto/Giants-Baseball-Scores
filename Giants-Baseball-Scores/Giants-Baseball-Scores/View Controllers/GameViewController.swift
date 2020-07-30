//
//  GameViewController.swift
//  Giants-Baseball-Scores
//
//  Created by Enzo Jimenez-Soto on 7/27/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    // Homepage Controller temporary instance
    let gameController = GameController()
    
    let stadiums = AllStadiums()
    
    var buttonLabel: String = ""
    
    // Properties
    var giantsGames: [Game] = []
    private var date = Date()
    private var searchDateString = ""
    
    // Day Navigation Label and Buttons
    @IBOutlet weak var nextDayButton: UIButton!
    @IBOutlet weak var dayBeforeButton: UIButton!
    @IBOutlet weak var dateTitleLabel: UILabel! {
        didSet {
            let currentDate = Date()
            if date == currentDate {
                dateTitleLabel.text = "Today"
            }
        }
    }
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var awayLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var noGamesLabel: UILabel!
    // Home Team Labels
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    
    //Away Team Labels
    @IBOutlet weak var awayImageView: UIImageView!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    
    // Game Score and Stadium Labels
    @IBOutlet weak var gameScoreLabel: UILabel!
    @IBOutlet weak var stadiumButton: UIButton!
    
    @IBAction func tapdayBeforeButton(_ sender: UIButton) {
        if let dayBefore = Calendar.current.date(byAdding: .day, value: -1, to: date) {
            date = dayBefore
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E, MMM d"
            let dateString = dateFormatter.string(from: dayBefore)
            dateTitleLabel.text = dateString
            dateTitleLabel.sizeToFit()
            searchDateString = formatDate(date: date)
            updateViews()
        }
    }
    @IBAction func tapNextDayButton(_ sender: UIButton) {
        if let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: date) {
            date = nextDay
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E, MMM d"
            
            let dateString = dateFormatter.string(from: nextDay)
            dateTitleLabel.text = dateString
            dateTitleLabel.sizeToFit()
            searchDateString = formatDate(date: date)
            print(searchDateString)
            updateViews()
        }
    }
    var filteredGames = [Game]()
    
    var noGamesOnDayArray = ["2020-07-22T00:00:00", "2020-07-27T00:00:00", "2020-08-13T00:00:00","2020-08-24T00:00:00","2020-08-31T00:00:00", "2020-09-03T00:00:00", "2020-09-14T00:00:00","2020-09-17T00:00:00","2020-09-28T00:00:00", "2020-09-29T00:00:00", "2020-09-30T00:00:00"]
    
    override func viewWillAppear(_ animated: Bool) {
        updateViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let cal = Calendar(identifier: .gregorian)
        let newDate = cal.startOfDay(for: date)
        searchDateString = formatDate(date: newDate)
            updateViews()
    }
    
    func updateViews() {
        
        if noGamesOnDayArray.contains(searchDateString) {
            self.homeImageView.isHidden = true
            self.homeTeamNameLabel.isHidden = true
            self.gameScoreLabel.isHidden = true
            self.homeLabel.isHidden = true
            self.scoreLabel.isHidden = true
            self.awayLabel.isHidden = true
            self.awayImageView.isHidden = true
            self.awayTeamNameLabel.isHidden = true
            self.stadiumButton.isHidden = true
            self.noGamesLabel.isHidden = false
        } else {
            gameController.fetchGiantsSchedule { (result) in
                
                self.giantsGames = self.gameController.gotDamnGiantsGames
                let giantsAwayGames = self.giantsGames.filter { $0.awayTeamName == "SF"}
                let giantsHomeGames = self.giantsGames.filter { $0.homeTeamName == "SF"}
                
                let allGiantsGames = giantsAwayGames + giantsHomeGames
                let filterDateGiantsGames = allGiantsGames.filter { $0.day == self.searchDateString }
                self.filteredGames = filterDateGiantsGames
                
                print(self.filteredGames)
                
                DispatchQueue.main.async {
                    
                    self.homeTeamNameLabel.text = self.filteredGames.first?.homeTeamName
                    self.awayTeamNameLabel.text = self.filteredGames.first?.awayTeamName
                    
                    if self.filteredGames.first?.homeTeamName == "SF" {
                        self.homeImageView.image = UIImage(named: "San Francisco Giants")
                        self.stadiumButton.setTitle(self.stadiums.sanFransiscoGiants.name, for: .normal)
                        self.buttonLabel = self.stadiums.sanFransiscoGiants.name
                    }
                    if self.filteredGames.first?.homeTeamName == "LAD" {
                        self.homeImageView.image = UIImage(named: "Los Angeles Dodgers")
                         self.stadiumButton.setTitle(self.stadiums.losAngelesDodgers.name, for: .normal)
                        self.buttonLabel = self.stadiums.losAngelesDodgers.name
                    }
                    if self.filteredGames.first?.homeTeamName == "SD" {
                        self.homeImageView.image = UIImage(named: "San Diego Padres")
                         self.stadiumButton.setTitle(self.stadiums.sanDiegoPadres.name, for: .normal)
                        self.buttonLabel = self.stadiums.sanDiegoPadres.name
                    }
                    if self.filteredGames.first?.homeTeamName == "TEX" {
                        self.homeImageView.image = UIImage(named: "Texas Rangers")
                         self.stadiumButton.setTitle(self.stadiums.texasRangers.name, for: .normal)
                        self.buttonLabel = self.stadiums.texasRangers.name
                    }
                    if self.filteredGames.first?.homeTeamName == "COL" {
                        self.homeImageView.image = UIImage(named: "Colorado Rockies")
                         self.stadiumButton.setTitle(self.stadiums.coloradoRockies.name, for: .normal)
                        self.buttonLabel = self.stadiums.coloradoRockies.name
                    }
                    if self.filteredGames.first?.homeTeamName == "HOU" {
                        self.homeImageView.image = UIImage(named: "Houston Astros")
                         self.stadiumButton.setTitle(self.stadiums.houstonAstros.name, for: .normal)
                        self.buttonLabel = self.stadiums.houstonAstros.name
                    }
                    if self.filteredGames.first?.homeTeamName == "OAK" {
                        self.homeImageView.image = UIImage(named: "Oakland Athletic")
                         self.stadiumButton.setTitle(self.stadiums.oaklandAthletic.name, for: .normal)
                        self.buttonLabel = self.stadiums.oaklandAthletic.name
                    }
                    if self.filteredGames.first?.homeTeamName == "LAA" {
                        self.homeImageView.image = UIImage(named: "Los Angeles Angels")
                         self.stadiumButton.setTitle(self.stadiums.losAngelesAngels.name, for: .normal)
                        self.buttonLabel = self.stadiums.losAngelesAngels.name
                    }
                    if self.filteredGames.first?.homeTeamName == "ARI" {
                        self.homeImageView.image = UIImage(named: "Arizona Diamondbacks")
                         self.stadiumButton.setTitle(self.stadiums.arizonaDiamondbacks.name, for: .normal)
                        self.buttonLabel = self.stadiums.arizonaDiamondbacks.name
                    }
                    if self.filteredGames.first?.homeTeamName == "SEA" {
                        self.homeImageView.image = UIImage(named: "Seattle Mariners")
                         self.stadiumButton.setTitle(self.stadiums.seattleMariners.name, for: .normal)
                        self.buttonLabel = self.stadiums.seattleMariners.name
                    }
                    if self.filteredGames.first?.awayTeamName == "SF" {
                        self.awayImageView.image = UIImage(named: "San Francisco Giants")
                    }
                    if self.filteredGames.first?.awayTeamName == "LAD" {
                        self.awayImageView.image = UIImage(named: "Los Angeles Dodgers")
                        
                    }
                    if self.filteredGames.first?.awayTeamName == "SD" {
                        self.awayImageView.image = UIImage(named: "San Diego Padres")
                    }
                    if self.filteredGames.first?.awayTeamName == "TEX" {
                        self.awayImageView.image = UIImage(named: "Texas Rangers")
                    }
                    if self.filteredGames.first?.awayTeamName == "COL" {
                        self.awayImageView.image = UIImage(named: "Colorado Rockies")
                    }
                    if self.filteredGames.first?.awayTeamName == "HOU" {
                        self.awayImageView.image = UIImage(named: "Houston Astros")
                    }
                    if self.filteredGames.first?.awayTeamName == "OAK" {
                        self.awayImageView.image = UIImage(named: "Oakland Athletic")
                    }
                    if self.filteredGames.first?.awayTeamName == "LAA" {
                        self.awayImageView.image = UIImage(named: "Los Angeles Angels")
                    }
                    if self.filteredGames.first?.awayTeamName == "ARI" {
                        self.awayImageView.image = UIImage(named: "Arizona Diamondbacks")
                    }
                    if self.filteredGames.first?.awayTeamName == "SEA" {
                        self.awayImageView.image = UIImage(named: "Seattle Mariners")
                    }
                    print(self.buttonLabel)
                    
                    let homeTeamRuns = self.filteredGames.first?.homeTeamRuns
                    let awayTeamRuns = self.filteredGames.first?.awayTeamRuns
                    
                    let gameRuns = "\(homeTeamRuns ?? 0) - \(awayTeamRuns ?? 0)"
                    
                    self.gameScoreLabel.text = gameRuns
                    self.homeImageView.isHidden = false
                    self.homeTeamNameLabel.isHidden = false
                    self.gameScoreLabel.isHidden = false
                    self.homeLabel.isHidden = false
                    self.scoreLabel.isHidden = false
                    self.awayLabel.isHidden = false
                    self.awayImageView.isHidden = false
                    self.awayTeamNameLabel.isHidden = false
                    self.stadiumButton.isHidden = false
                    self.noGamesLabel.isHidden = true
                    
                    print(gameRuns)
                }
            }
        }
    }
    private func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let endOfDateString = "T00:00:00"
        let dateString = dateFormatter.string(from: date) + endOfDateString
        return dateString
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? StadiumViewController {
                   nextVC.stadiumButtonTitle = buttonLabel
                   
    }
        print(buttonLabel)
}

}
