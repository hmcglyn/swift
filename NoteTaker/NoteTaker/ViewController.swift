//
//  ViewController.swift
//  NoteTaker
//
//  Created by Hakan Çağlayan on 13.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblBirthday: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtBirthday: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let storedName=UserDefaults.standard.object(forKey: "name")
        let storedBirthday=UserDefaults.standard.object(forKey: "birthday")
        if let name = storedName as? String{
            lblName.text=name
        }
        if let birthday = storedBirthday as? String{
            lblBirthday.text=birthday
        }
        
    }
    
    @IBAction func btnDelete(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.removeObject(forKey: "birthday")
    }
    @IBAction func btnSave(_ sender: Any) {
        UserDefaults.standard.set(txtName.text!, forKey: "name")
        UserDefaults.standard.set(txtBirthday.text!, forKey: "birthday")
        lblName.text="Name: \(txtName.text!)"
        lblBirthday.text="Birthday: \(txtBirthday.text!)"
    }
}

