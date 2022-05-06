//
//  ViewController.swift
//  FirstSwiftApp
//
//  Created by Hakan Mert Çağlayan on 12.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCharacter: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeButtonClicked(_ sender: Any) {
        imageView.image = UIImage(named: "whisp")
        lblCharacter.text="Whisp"
    }
    
}

