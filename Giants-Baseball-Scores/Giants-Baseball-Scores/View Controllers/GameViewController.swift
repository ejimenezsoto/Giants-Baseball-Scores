//
//  GameViewController.swift
//  Giants-Baseball-Scores
//
//  Created by Enzo Jimenez-Soto on 7/27/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    // Day Navigation Label and Buttons
    @IBOutlet weak var nextDayButton: UIButton!
    @IBOutlet weak var dayBeforeButton: UIButton!
    @IBOutlet weak var dateTitleLabel: UILabel!
    
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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
