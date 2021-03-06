//
//  SettingsViewController.swift
//  EverydayNASA
//
//  Created by Simão Samouco on 02/04/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
   
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var langChoiceEx: UISegmentedControl!
    @IBOutlet weak var pickerView: UIPickerView!
    var pickerData: [String] = [String]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        /*self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true*/
        
        // Connect data:
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
       
        
        if UserDefaults.standard.integer(forKey: "segmentedControll") == 0{
            pickerData = ["Kilometros/hora | Metros", "Milhas/hora | Feet", "Kilometros/hora | Feet", "Milhas/hora | Metros"]
        }else if UserDefaults.standard.integer(forKey: "segmentedControll") == 1{
            pickerData = ["Kilometers/hour | Meters", "Miles/hour | Feet", "Kilometers/hour | Feet", "Miles/hour | Meters"]
        }
        
        
        let y = NSLocalizedString("settings_label", comment: "")
        settingsLabel.text = y
        
        langChoiceEx.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "segmentedControll")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
     let titleData = pickerData[row]
     let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
     
     return myTitle
     }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        defaults.set(row, forKey: "selectedIndexAux")
        print("selectedIndexAux = \(row)")
    }
    
    
    
    @IBAction func langChoice(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            UserDefaults.standard.set(0, forKey: "segmentedControll")
            UserDefaults.standard.set(nil, forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            print("Default Language: PT")
            /*
            defaults.set("ptt", forKey: "Language")
            print("primeira opção escolhida (PORTUGUESE)")*/
            break
        case 1:
            UserDefaults.standard.set(1, forKey: "segmentedControll")
            UserDefaults.standard.set("en", forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            print("Default Language: EN")
            
            
            /*defaults.set("enn", forKey: "Language")
            print("segunda opção escolhida (ENGLISH)")*/
            break
        default:
            print("segunda opção escolhida (ENGLISH)")
        }
    }
    
}
