//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by Wajeeh Anwar on 11/5/16.
//  Copyright © 2016 Wajeeh Anwar. All rights reserved.
//

import UIKit
// Add CoreData to store information.
import CoreData


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    // Declare and Initialize global Core Data fetched data
    var fluidTypeArray:[String] = []
    var fluidAmountArray:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Fetch Core Data (Delegated to Helper Method)
        fetchFluidCoreData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // Add new entry to Core Data (Helper method)
    func addFluidToCoreData(fluidType: String, fluidAmount: String) {
        
        fluidAmountValue.text = "\(fluidAmount) OZ of \(fluidType) has been added"
        
        
        
        // Define where Core Data is and access the content
        let coreDataLocation = UIApplication.shared.delegate as! AppDelegate
        let coreDataContents = coreDataLocation.persistentContainer.viewContext
        print("...ready to insert entry")
        // Add new Entry to Core Data
        let newFluidEntry = NSEntityDescription.insertNewObject(forEntityName: "Fluids", into: coreDataContents)
        newFluidEntry.setValue(fluidType, forKey: "fluidType")
        newFluidEntry.setValue(fluidAmount, forKey: "fluidAmount")
        print("...entries inserted")
        // Save Core Data
        do {
            try coreDataContents.save()
            print ("SAVED")
        } catch {
            print("Error at save core data")
        }
    }
    
    
    // Fetch Core Data Entries (Helper Method)
    func fetchFluidCoreData() {
        // Define where Core Data is and access the content
        let coreDataLocation = UIApplication.shared.delegate as! AppDelegate
        let coreDataContents = coreDataLocation.persistentContainer.viewContext
        
        // Request Core Data Entries
        let requestedFluidData = NSFetchRequest<NSFetchRequestResult>(entityName: "Fluids")
        // Uncompress Core Data
        requestedFluidData.returnsObjectsAsFaults = false
        
        // Keep fetching All Core Data
        do {
            // Fetch Requested Core Data
            let fetchedFluidData = try coreDataContents.fetch(requestedFluidData)
            
            // Save Fetched Core Data to Arrays
            if fetchedFluidData.count > 0 {
                for fluidData in fetchedFluidData as! [NSManagedObject] {
                    if let fluidType = fluidData.value(forKey: "fluidType") as? String {
                        fluidTypeArray.append(fluidType)
                        print(fluidType)
                    }
                    if let fluidAmount = fluidData.value(forKey: "fluidAmount") as? String {
                        fluidAmountArray.append(fluidAmount)
                        print(fluidAmount)
                    }
                }
            }
        } catch {
            // Catch If Core Data Not Fetched
        }
    }
    
    
    
    
    
    
    // Initialize fluid slider.

    @IBOutlet weak var fluidAmountValue: UILabel!
    @IBOutlet weak var fluidAmount: UISlider!
    @IBAction func fluidAmountSliderAction(_ sender: UISlider) {
    
        
        
        fluidAmountValue.text = String(format: "%.1f",fluidAmount.value)
        
    }
    
    @IBAction func addCoffee(_ sender: UIButton) {
        let thisFluidType = "Coffee"
        let Amount = String(format: "%.1f",fluidAmount.value)
        addFluidToCoreData(fluidType: thisFluidType, fluidAmount: Amount)
    }
    
    // Add Water confirmation
    @IBAction func addWater(_ sender: UIButton) {
        let thisFluidType = "Water"
        let Amount = String(format: "%.1f",fluidAmount.value)
        addFluidToCoreData(fluidType: thisFluidType, fluidAmount: Amount)
        //fluidAmountValue.text = "\(Amount) OZ of water has been added"
    }
    
    
    @IBAction func FetchTest(_ sender: UIButton) {
        fetchFluidCoreData()
        let todaysDate:Date = Date()
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let DateInFormat:String = dateFormatter.string(from: todaysDate)
        print(DateInFormat)
        
        
    }
    
    // Custom cell
    @IBOutlet weak var tableView: UITableView!
    
    
    // TableView Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fluidTypeArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 
//        var cell = UITableViewCell()
//        let(fluidType) = fluidTypeArray[indexPath.row]
//        cell.textLabel?.text = fluidType
//        return cell
        
        // custom cell view
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.fluidIcon.image = UIImage(named: fluidTypeArray[indexPath.row])
        cell.fluidType.text = fluidTypeArray[indexPath.row]
        cell.fluidAmount.text = fluidAmountArray[indexPath.row]
        
        return cell
    }

    
    
    
}
