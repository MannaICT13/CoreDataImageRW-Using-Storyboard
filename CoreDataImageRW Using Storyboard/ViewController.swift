//
//  ViewController.swift
//  CoreDataImageRW Using Storyboard
//
//  Created by Md Khaled Hasan Manna on 3/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var saveImage: UIImageView!
    @IBOutlet weak var getImage: UIImageView!
    
    let imagePicker = UIImagePickerController()
    var profile = [Profile]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGesture()
        profile = DatabaseHelper.dbInstance.getProfileData()
       
    }
    
    func tapGesture(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage(_ :)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        self.saveImage.isUserInteractionEnabled = true
        self.saveImage.addGestureRecognizer(tapGesture)
        
        
    }
    
    @objc func selectImage(_ sender : UITapGestureRecognizer){
        
        getImageFromGallery()
        
        
    }
    
    
    
    
    

    @IBAction func saveImageAction(_ sender: Any) {
        
        let name = "Manna vai"
        let png = self.saveImage.image?.pngData()
        
        let _ = self.saveImage.image?.jpegData(compressionQuality: 0.75)
        
        let dic : [String : Any] = ["name" : name,"img" : png!]
        DatabaseHelper.dbInstance.saveProfileData(data: dic)
        
        
        
    }
    
    
    
    @IBAction func getImageAction(_ sender: Any) {
        
        getImage.image = UIImage(data: profile[1].img!)
       
        
        
    }
    
}

extension ViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    
    func getImageFromGallery(){
        
        imagePicker.delegate = self
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let img = info[.originalImage] as? UIImage{
            
            self.saveImage.image = img
            saveImage.contentMode = .scaleAspectFill
            saveImage.backgroundColor = UIColor.clear
            
            
            
        }
        
        self.dismiss(animated: true, completion: nil)
        
        
        
        
    }
    
    
    
    
    
}
