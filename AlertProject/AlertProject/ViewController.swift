//
//  ViewController.swift
//  AlertProject
//
//  Created by Hakan Mert Çağlayan on 15.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPassword2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSignUp(_ sender: Any) {
        var msg=""
        var title="Hata";
        if (txtUserName.text?.isEmpty)! {
            msg="Kullanıcı adı  belirtin"
        } else if (txtPassword.text?.isEmpty)! {
            msg="Parola belirtin"
        } else if (txtPassword2.text?.isEmpty)!{
            msg="Parolanızı tekrar girin"
        } else if txtPassword.text! != txtPassword2.text!{
            msg="Parolalarınız birbirleriyle aynı değil"
        }
        
        if msg == ""{
            msg="Kayıt başarılı"
            title="Başırılı"
            
        }
        
        ShowAlert(msgTitle: title, msg: msg)
           /* let alert=UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
            let okButton=UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            */
            
        }
    
    func ShowAlert(msgTitle : String,msg : String){
        let alert=UIAlertController(title:msgTitle,message: msg,preferredStyle: UIAlertController.Style.alert)
        let btnOk=UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
        alert.addAction(btnOk)
        self.present(alert, animated: true)
    }
    }


