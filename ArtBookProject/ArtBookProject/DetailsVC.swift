//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Hakan Çağlayan on 16.12.2022.
//

import UIKit
import CoreData

class DetailsVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtArtist: UITextField!
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    var chosenPainting=""
    var chosenPaintingId : UUID?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(chosenPainting != "")
        {
            btnSave.isHidden=true
            //Core Data
            let appDelegate=UIApplication.shared.delegate as! AppDelegate
            let context=appDelegate.persistentContainer.viewContext
            let fetchRequest=NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            let idString=chosenPaintingId?.uuidString
            fetchRequest.predicate=NSPredicate(format: "id=%@", idString!)
            fetchRequest.returnsObjectsAsFaults=false
            
            do{
                let results = try context.fetch(fetchRequest)
                if(results.count>0)
                {
                    for result in results as! [NSManagedObject]
                    {
                        if let name = result.value(forKey: "name") as? String
                        {
                            txtName.text=name
                        }
                        if let artist = result.value(forKey: "artist") as? String
                        {
                            txtArtist.text=artist
                        }
                        if let year = result.value(forKey: "year") as? Int
                        {
                            txtYear.text=String(year)
                        }
                        if let imageData = result.value(forKey: "image") as? Data{
                            let image=UIImage(data:imageData)
                            imgPhoto.image=image
                        }
                        
                    }
                }
            }catch{
                print("error")
            }
        }
        else
        {
            btnSave.isEnabled=false
            btnSave.isHidden=false
        }
        
        //Recognizers
        let gestureRecognizer=UITapGestureRecognizer(target: self, action: #selector(HideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imgPhoto.isUserInteractionEnabled=true
        let imgTapRecognizer=UITapGestureRecognizer(target: self, action: #selector(SelectPhoto))
        imgPhoto.addGestureRecognizer(imgTapRecognizer)
              
    }
    
    @objc func SelectPhoto()
    {
        let picker=UIImagePickerController()
        picker.delegate = self
        picker.sourceType  = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true,completion: nil)
    }
    //img picker photo seçimi
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imgPhoto.image=info[.originalImage] as? UIImage
        btnSave.isEnabled=true
        self.dismiss(animated: true)
    }
   
    @objc func HideKeyboard()
    {
        view.endEditing(true)
    }
    @IBAction func btnSave(_ sender: Any) {
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        let context=appDelegate.persistentContainer.viewContext
        
        let newPainting=NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        newPainting.setValue(txtName.text!, forKey: "name")
        newPainting.setValue(txtArtist.text!, forKey: "artist")
        if let year = Int(txtYear.text!){
            newPainting.setValue(year, forKey: "year")
        }
        newPainting.setValue(UUID(), forKey: "id")
        let data=imgPhoto.image!.jpegData(compressionQuality: 0.5)
        newPainting.setValue(data, forKey: "image")
        do
        {
            try context.save()
            print("saved")
        }catch
        {
            print("error")
        }
        
        //ViewControllerlara notification göndermek için kullanılır.
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        self.navigationController?.popViewController(animated: true)
    
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
