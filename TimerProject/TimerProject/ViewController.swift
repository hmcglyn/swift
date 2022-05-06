//
//  ViewController.swift
//  TimerProject
//
//  Created by Hakan Mert Çağlayan on 18.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTime: UILabel!
    var timer=Timer()
    var counter=10;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }

    @objc func timerFunction(){
        lblTime.text="Time: \(counter)"
        counter-=1
        
        if counter==0{
            timer.invalidate()
            lblTime.text="Time has come"
        }
    }
    @IBAction func btnClick(_ sender: Any) {
        print("button clicked")
    }
    
}

