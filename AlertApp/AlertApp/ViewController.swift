//
//  ViewController.swift
//  AlertApp
//
//  Created by Hakan Çağlayan on 14.12.2022.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var txtRePassword: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
 
    @IBOutlet weak var txtUserName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func MakeAlert(titleInput : String, messageInput : String)
    {
        let alert=UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton=UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }

    @IBAction func btnSignUp(_ sender: Any) {
    
        if(txtUserName.text == ""){
            MakeAlert(titleInput: "Hata", messageInput: "Geçerli bir kullanıcı adı belirtin.")
        }
        else if(txtPassword.text == "")
        {
            MakeAlert(titleInput: "Hata", messageInput: "Geçerli bir parola belirtin.")
        }
        else if(txtPassword.text != txtRePassword.text)
        {
            MakeAlert(titleInput: "Hata", messageInput: "Girilen parolalar aynı olmak zorundadır.")
        }
        else
        {
            MakeAlert(titleInput: "Başarılı", messageInput: "Ok")
        }
    }
    
}

