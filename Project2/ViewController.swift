//
//  ViewController.swift
//  Project2
//
//  Created by Anita Stashevskaya on 26.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    //let labelScore = UILabel()
    
    @IBOutlet var labelScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //let labelFrame = CGRect(x: 0, y: 0, width: 100, height: 23)
        
        //labelScore.frame = labelFrame
        //labelScore.text = "Kekrxdtcfygvkjhbknlm,;mknjkbhjvghcfgxdsz"
        //labelScore.font = UIFont.boldSystemFont(ofSize: 14)
        //labelScore.textColor = .black
        
        //labelScore.center = self.view.center
        
        //view.addSubview(labelScore)
        
        countries += ["estonia", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1 //рамочки
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor(red: 1.0, green: 0.3, blue: 0.9, alpha: 1.0).cgColor //also color, 1.0 is MAX
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
        labelScore.text = "Total score is 0"
    }
    
    /*Buttons have a setImage() method that lets us control what picture is shown inside and when, so we can use that with UIImage to display our flags.*/
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle() //shuffle array's items
        correctAnswer = Int.random(in: 0...2) // random 1 to 2 inclusive
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() //title is вверху
    }
    
    func label(tex: Int){
        labelScore.text = "Total score is \(tex)"
    }
/*
button1.setImage() assigns a UIImage to the button. We have the US flag in there right now, but this will change it when askQuestion() is called.
for: .normal The setImage() method takes a second parameter that describes which state of the button should be changed. We're specifying .normal, which means "the standard state of the button."
     */
    var askedQuestions = 0
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        askedQuestions += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! That’s the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        label(tex: score)
        
        print(askedQuestions)
        if askedQuestions != 3 {
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        } else {
            let an = UIAlertController(title: title, message: "Your total score is \(score)", preferredStyle: .alert)
            an.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(an, animated: true)
        }
        
    }
    
    //There are three possible styles: .default, .cancel, and .destructive
    //.alert pops up a message box over the center of the screen
    //.actionSheet slides options up from the bottom
    //present() takes two parameters: a view controller to present and whether to animate the presentation. It has an optional third parameter that is another closure that should be executed when the presentation animation has finished, but we don’t need it here
    
}

