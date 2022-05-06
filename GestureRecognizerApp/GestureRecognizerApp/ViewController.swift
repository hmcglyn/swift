//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Hakan Mert Çağlayan on 15.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgView.isUserInteractionEnabled = true
        let gestRecognizer=UITapGestureRecognizer(target: self, action: #selector(changePic))
        
        imgView.addGestureRecognizer(gestRecognizer)
    }

    @objc func changePic(){
        if imgView.image == UIImage(named: "whisp") {
            imgView.image   = UIImage(named: "morph")
            lblName.text = "morph"
        } else {
            imgView.image   = UIImage(named: "whisp")
            lblName.text="whisp"
        }
        
        
    }
}

