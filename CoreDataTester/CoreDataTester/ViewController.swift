//
//  ViewController.swift
//  CoreDataTester
//
//  Created by Wajeeh Anwar on 11/5/16.
//  Copyright © 2016 Wajeeh Anwar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let coreDataLocation = UIApplication.shared.delegate as! AppDelegate
        let coreDataPersistentContents = coreDataLocation.persistentContainer.viewContext
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: coreDataPersistentContents)
        newUser.setValue("Wajeeh", forKey: "firstName")
        newUser.setValue("Anwar", forKey: "lastName")
        
        do {
            try coreDataPersistentContents.save()
        } catch {
            print("***save error***")
        }
        
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        
        do {
            let results = try coreDataPersistentContents.fetch(request)
           
            if results.count > 0 {
                
            
                for result in results as! [NSManagedObject] {
                    if let firstName = result.value(forKey: "firstName") as? String {
                        print("First Name is \(firstName)")
                    }
                    if let lastName = result.value(forKey: "lastName") as? String {
                        print("Last Name is \(lastName)")
                    }
                }

            }
        } catch {
            print("***fetch error***")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

