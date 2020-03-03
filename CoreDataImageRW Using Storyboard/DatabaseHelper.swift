//
//  DatabaseHelper.swift
//  CoreDataImageRW Using Storyboard
//
//  Created by Md Khaled Hasan Manna on 3/3/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class DatabaseHelper {
    
    
    static let dbInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func saveProfileData(data : [String:Any]){
        
        let profile = NSEntityDescription.insertNewObject(forEntityName: "Profile", into: context) as! Profile
        profile.name = data["name"] as? String
        profile.img  = data["img"] as? Data
        
        do{
            try context.save()
            
        }catch{
            
            
            print(error.localizedDescription)
        }
        
        
        
        
        
        
    }
    
    func getProfileData() -> [Profile]{
        
        var profile = [Profile]()
        
        let getData = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        
        do{
            profile = try context.fetch(getData) as! [Profile]
            
        }catch{
            
            
            print("Error in get Data")
        }
        
        
        return profile
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
