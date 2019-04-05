//
//  ChooseImageViewController.swift
//  EverydayNASA
//
//  Created by Simão Samouco on 04/04/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import UIKit

class ChooseImageViewController: UIViewController {

    var year:String!
    var month:String!
    var day:String!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
         year = dateFormatter.string(from: self.datePicker.date)
        dateFormatter.dateFormat = "MM"
        month = dateFormatter.string(from: self.datePicker.date)
        dateFormatter.dateFormat = "dd"
     day = dateFormatter.string(from: self.datePicker.date)
        
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        
       
        datePicker.maximumDate = Date()
        
    }

    //8795 7900 9573
    
    @IBAction func letsGoButton(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        year = dateFormatter.string(from: self.datePicker.date)
        dateFormatter.dateFormat = "MM"
        month = dateFormatter.string(from: self.datePicker.date)
        dateFormatter.dateFormat = "dd"
        day = dateFormatter.string(from: self.datePicker.date)
        performSegue(withIdentifier: "fromDateToPic", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromDateToPic" {
            
            let controller = segue.destination as? PictureDayViewController
            controller?.yearReceived = self.year
            controller?.monthReceived = self.month
            controller?.dayReceived = self.day
        }else if segue.identifier == "segueMenu"{
            print("JINGLE BELLS")
        }
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
