//
//  DetailsVC.swift
//  SimpsonBook
//
//  Created by Hakan Çağlayan on 16.12.2022.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblJob: UILabel!
    var selectedSimpson : Simpsons?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text=selectedSimpson?.Name
        lblJob.text=selectedSimpson?.Job
        ImgView.image=selectedSimpson?.Image

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
