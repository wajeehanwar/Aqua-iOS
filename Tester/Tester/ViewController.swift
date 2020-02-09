//
//  ViewController.swift
//  Tester
//
//  Created by Wajeeh Anwar on 11/3/16.
//  Copyright © 2016 Wajeeh Anwar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // declare variables
    @IBOutlet var colorSelector: UISegmentedControl!
    
    @IBOutlet var colorSelect: UISegmentedControl!
    @IBOutlet var sampleText: UITextField!

    @IBOutlet weak var textLabel: UITextField!

    
//************************
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//************************
    
    
    


    // return the color selected
    func getColor() -> UIColor {
        switch colorSelector.selectedSegmentIndex {
        case 0:
            return UIColor.red
        case 1:
            return UIColor.green
        case 2:
            return UIColor.blue
        case 3:
            return UIColor.yellow
        default:
            return UIColor.black
        }
    }

    
    @IBAction func previewColor(_ sender: UIButton) {
        //print(getColor().description)
        sampleText.textColor = getColor()
    }

    @IBAction func setColor(_ sender: UIButton) {
    }
    @IBAction func colorSelectorInstant(_ sender: Any) {
        switch colorSelect.selectedSegmentIndex {
        case 0:
            textLabel.textColor = UIColor.red
        case 1:
            textLabel.textColor = UIColor.green
        case 2:
            textLabel.textColor = UIColor.blue
        case 3:
            textLabel.textColor = UIColor.yellow
        default:
            break
        }
    }


}
