//
//  ViewController.swift
//  CatchTheCiko
//
//  Created by Hakan Mert Çağlayan on 18.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblHighScore: UILabel!
    @IBOutlet weak var imgCiko: UIImageView!
    var timerCounter=30
    var scoreCounter=0
    var highScore=0
    var timer = Timer()
    var imgChangeTimer=Timer()
    @IBOutlet weak var container: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        imgCiko.isUserInteractionEnabled=true
        let recognizer=UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        imgCiko.addGestureRecognizer(recognizer)
        
        let storedHighScore=UserDefaults.standard.object(forKey: "highScore")
        if storedHighScore==nil{
            highScore=0
            lblHighScore.text = "High Score: \(highScore)"
        }
        if let newScore = UserDefaults.standard.object(forKey: "highScore") as? Int {
            lblHighScore.text = "High Score: \(newScore)"
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
        imgChangeTimer=Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeImgPosition), userInfo: nil, repeats: true)
    }
    @objc func increaseScore()
    {
        scoreCounter+=1
        lblScore.text="Score: \(scoreCounter)"
    }

    @objc func timerFunction()
    {
        timerCounter-=1
        lblTimer.text="Time: \(timerCounter)"
        if timerCounter==0{
            timer.invalidate()
            imgChangeTimer.invalidate()
            
//            Alert
            let alert=UIAlertController(title: "Time is Up", message: "Your score: \(scoreCounter)", preferredStyle: UIAlertController.Style.alert)
            let btnOk=UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel,handler: nil)
            let btnReplay=UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                self.scoreCounter=0
                self.timerCounter=30
                self.lblScore.text="Score: \(self.scoreCounter)"
                self.lblTimer.text=String(self.timerCounter)
                self.timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerFunction), userInfo: nil, repeats: true)
                
                self.imgChangeTimer=Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.changeImgPosition), userInfo: nil, repeats: true)
            }
            alert.addAction(btnOk)
            alert.addAction(btnReplay)
            self.present(alert, animated: true)
            
            if scoreCounter>highScore{
                highScore=scoreCounter
                lblHighScore.text="High Score: \(highScore)"
                UserDefaults.standard.set(highScore, forKey: "highScore")
            }
            
        }
    }
    
    @objc func changeImgPosition()
    {
        let minX=container.safeAreaLayoutGuide.layoutFrame.minX
        let maxX=container.safeAreaLayoutGuide.layoutFrame.maxX
        let minY=container.safeAreaLayoutGuide.layoutFrame.minY
        let maxY=container.safeAreaLayoutGuide.layoutFrame.maxY
        
        imgCiko.frame.origin.x=Double.random(in: minX+imgCiko.frame.width*0.5...maxX-imgCiko.frame.width*0.5)
        imgCiko.frame.origin.y=Double.random(in: minY+imgCiko.frame.height*0.5...maxY-imgCiko.frame.height*0.5)
    }
}

