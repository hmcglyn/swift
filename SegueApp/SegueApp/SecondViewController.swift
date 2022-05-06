//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Hakan Mert Çağlayan on 14.04.2022.
//

import UIKit

class SecondViewController: UIViewController {

    var myName=""
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSecond: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text=myName
        
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
