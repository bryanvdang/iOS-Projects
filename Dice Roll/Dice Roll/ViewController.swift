//
//  ViewController.swift
//  Dice Roll
//
//  Created by Bryan Dang on 4/13/20.
//  Copyright © 2020 Bryan Dang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        
        dice1.image = diceArray.randomElement()
        dice2.image = diceArray[Int.random(in: 0...5)] //does the samme thing as 'random.Element()'
    }
    
}

