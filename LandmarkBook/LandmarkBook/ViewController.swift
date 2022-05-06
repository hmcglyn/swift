//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Hakan Mert Çağlayan on 19.04.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblLandMarks: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblLandMarks.delegate=self
        tblLandMarks.dataSource=self
        var list =["Colosseum": UIImage(named: "colosseum"),
                   "Stonehendge" : UIImage(named: "stonehendge"),
                   "Kremlin" : UIImage(named: "kremlin"),
                   "Taj Mahal" : UIImage(named: "tajmahal")]
//        var landmarkNames=[String]()
//        landmarkNames.append("Colosseum")
//        landmarkNames.append("Stonehendge")
//        landmarkNames.append("Kremlin")
//        landmarkNames.append("Taj Mahal")
//        
//        var landmarkImages=[UIImage]()
//        landmarkImages.append(UIImage(named: "colosseum")!)
//        landmarkImages.append(UIImage(named: "stonehendge")!)
//        landmarkImages.append(UIImage(named: "kremlin")!)
//        landmarkImages.append(UIImage(named: "tajmahal")!)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text="test"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}

