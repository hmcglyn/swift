//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Hakan Mert Çağlayan on 14.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtBirthday: UITextField!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBirthday: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //lblName.text=UserDefaults.standard.object(forKey: "name") as? String
        //lblBirthday.text=UserDefaults.standard.object(forKey: "birthday") as? String
        
        //optional
        if let newName = UserDefaults.standard.object(forKey: "name") as? String {
            lblName.text = "Name: \(newName)"
        }
        if let newBirthdate = UserDefaults.standard.object(forKey: "birthday") as? String{
            lblBirthday.text = "Birthday: \(newBirthdate)"
        }
    }

    @IBAction func btnSave(_ sender: Any) {
        
        UserDefaults.standard.set(txtName.text!, forKey: "name")
        UserDefaults.standard.set(txtBirthday.text!, forKey: "birthday")
        
        lblName.text="Name: \(txtName.text!)"
        lblBirthday.text="Birthday: \(txtBirthday.text!)"
    }
    @IBAction func btnDelete(_ sender: Any) {
        let storedName=UserDefaults.standard.object(forKey: "name")
        let storedBirthday=UserDefaults.standard.object(forKey: "birthday")
        
        if  (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            lblName.text="Name: "
        }
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            lblBirthday.text="Birthday: "
        }
        
        
    }
    
}

