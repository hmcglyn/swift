//
//  ViewController.swift
//  Calculator
//
//  Created by Hakan Mert Çağlayan on 13.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        txtNumber1.placeholder="Number 1"
        txtNumber2.placeholder="Number 2"
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var txtNumber1: UITextField!
    @IBOutlet weak var txtNumber2: UITextField!
    @IBOutlet weak var lblResult: UILabel!
        
    @IBAction func btnAddition(_ sender: Any) {
        if(checkFields()){
            if let n1=Int32(txtNumber1.text!){
                if let n2=Int32(txtNumber2.text!){
                    lblResult.text=String(n1+n2)
                }
            }
        }
    }
    
    @IBAction func btnExtraction(_ sender: Any) {
        if(checkFields()){
            if let n1=Int32(txtNumber1.text!){
                if let n2=Int32(txtNumber2.text!){
                    lblResult.text=String(n1-n2)
                }
            }
        }
    }
    @IBAction func btnMultiplication(_ sender: Any) {
        if(checkFields()){
            if let n1=Int32(txtNumber1.text!){
                if let n2=Int32(txtNumber2.text!){
                    lblResult.text=String(n1*n2)
                }
            }
        }
    }
    @IBAction func btnDivision(_ sender: Any) {
        if(checkFields()){
            if let n1=Int32(txtNumber1.text!){
                if let n2=Int32(txtNumber2.text!){
                    lblResult.text=String(n1/n2)
                }
            }
        }
    }
    
    func checkFields()-> Bool{
        if Int32(txtNumber1.text!) == nil || Int32(txtNumber2.text!)==nil{
            lblResult.text="Geçerli bir ilk değer belirtin"
            return false;
        }
        lblResult.text=""
        return true;
        
        if let n1=Int32(txtNumber1.text!) {
            return true
        } else if let n2=Int32(txtNumber2.text!) {
            return true
        } else {
            lblResult.text="Geçerli bir ilk değer belirtin"
            return false
        }
    }
}

