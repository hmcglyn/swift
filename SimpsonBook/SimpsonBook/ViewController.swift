//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Hakan Çağlayan on 16.12.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tblView: UITableView!
  
    
    var mySimpsons = [Simpsons]()
    var chosenSimpson : Simpsons?
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource=self
        tblView.delegate=self
        let homer = Simpsons(Name: "Homer Simpson", Job: "Nuclear Safety", Image: UIImage(named: "homer_simpson")!)
        let maggie=Simpsons(Name: "Maggie Simpson", Job: "Baby", Image: UIImage(named: "maggie_simpson")!)
        let lisa=Simpsons(Name: "Lisa Simpson", Job: "Student", Image: UIImage(named: "lisa_simpson")!)
        let marge=Simpsons(Name: "Marge Simpson", Job: "Housewife", Image: UIImage(named: "marge_simpson")!)
        mySimpsons.append(homer)
        mySimpsons.append(maggie)
        mySimpsons.append(lisa)
        mySimpsons.append(marge)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell=UITableViewCell();
            var content=cell.defaultContentConfiguration()
            content.text=mySimpsons[indexPath.row].Name
            cell.contentConfiguration=content
            return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson=mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "ToDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="ToDetailsVC")
        {
            let destinationVC=segue.destination as! DetailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
}

