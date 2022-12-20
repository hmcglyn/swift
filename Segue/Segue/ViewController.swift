//
//  ViewController.swift
//  Segue
//
//  Created by Hakan Çağlayan on 14.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblFirstController: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="toSecondVc")
        {
            let destinationVc=segue.destination as! SecondViewController
            
            destinationVc.nameData=txtName.text as! String
        }
    }

    @IBAction func btnSave(_ sender: Any) {
        UserDefaults.standard.set(txtName.text!, forKey: "name")
        performSegue(withIdentifier: "toSecondVc", sender: nil)
    }
}

