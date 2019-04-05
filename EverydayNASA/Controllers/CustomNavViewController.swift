//
//  CustomNavViewController.swift
//  EverydayNASA
//
//  Created by Simão Samouco on 05/04/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import UIKit

class CustomNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //self.navigationBar.shadowImage = UIImage()
        self.navigationBar.backgroundColor = UIColor(white: 1, alpha: 0.2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
