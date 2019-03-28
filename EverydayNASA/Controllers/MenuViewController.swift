//
//  MenuViewController.swift
//  NASADaily
//
//  Created by Simão Samouco on 25/03/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    let date = Date()
    let formatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        /*formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        print(result)*/
        

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func goToPic(_ sender: Any) {
        performSegue(withIdentifier: "segueToPic", sender: self)
    }
    
    
    @IBAction func goToAsteroids(_ sender: Any) {
        performSegue(withIdentifier: "goToAsteroids", sender: self)
    }
    
}
