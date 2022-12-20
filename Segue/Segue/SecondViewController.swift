//
//  SecondViewController.swift
//  Segue
//
//  Created by Hakan Çağlayan on 14.12.2022.
//

import UIKit

class SecondViewController: UIViewController {

    var nameData="";
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSecondController: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text="Name: \(nameData)"

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
