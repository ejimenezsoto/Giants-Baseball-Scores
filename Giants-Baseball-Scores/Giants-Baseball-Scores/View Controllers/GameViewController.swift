//
//  GameViewController.swift
//  Giants-Baseball-Scores
//
//  Created by Enzo Jimenez-Soto on 7/27/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
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
    // Home Team Labels
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var homeStandingsLabel: UILabel!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    
    //Away Team Labels
    @IBOutlet weak var awayImageView: UIImageView!
    @IBOutlet weak var awayStandingsLabel: UILabel!
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
         }
     }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    
    
    private func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
 
    
    
    
}
