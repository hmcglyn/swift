//
//  ViewController.swift
//  SegueApp
//
//  Created by Hakan Mert Çağlayan on 14.04.2022.
//

import UIKit

class ViewController: UIViewController {

   var userName=""
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblFirst: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewWillDisappear called")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDiDisappear called")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear called")
    }
    


    @IBAction func btnNext(_ sender: Any) {
        userName=txtName.text!
        performSegue(withIdentifier: "ToSecondVC", sender: nil)
    }
    
    //Segue olmadan önceki yapılacak işlemler
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToSecondVC" {
            let destinationVC=segue.destination as! SecondViewController
            destinationVC.myName=userName
        }
    }
    
}

