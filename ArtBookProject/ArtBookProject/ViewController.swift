//
//  ViewController.swift
//  ArtBookProject
//
//  Created by Hakan Çağlayan on 16.12.2022.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var nameArray=[String]()
    var idArray=[UUID]()
    var selectedPainting=""
    var selectedPaintingId : UUID?
    
    @IBOutlet weak var tblList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblList.delegate=self
        tblList.dataSource=self
       
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
        
        getData()
    }
    
     override func viewWillAppear(_ animated: Bool) {
         NotificationCenter.default.addObserver(self, selector: #selector(getData), name:NSNotification.Name("newData"), object: nil)
    }
    
    @objc func getData()
    {
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        let context=appDelegate.persistentContainer.viewContext
        
        let fetchRequest=NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        fetchRequest.returnsObjectsAsFaults=false
        
        do{
            let results=try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject]
            {
                if let name = result.value(forKey: "name") as? String
                {
                    self.nameArray.append(name)
                }
                    
                if let id = result.value(forKey: "id") as? UUID
                {
                    self.idArray.append(id)
                }
            }
            
            self.tblList.reloadData()
        }
        catch{
            print("error")
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=UITableViewCell()
        var content=cell.defaultContentConfiguration()
        content.text=nameArray[indexPath.row]
        cell.contentConfiguration=content
        return cell
    }
    
    @objc func addButtonClicked()
    {
        selectedPainting=""
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="toDetailsVC")
        {
            let destinationVC=segue.destination as! DetailsVC
            destinationVC.chosenPainting=selectedPainting
            destinationVC.chosenPaintingId=selectedPaintingId
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPainting=nameArray[indexPath.row]
        selectedPaintingId=idArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    


}

