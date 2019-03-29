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
        //UIApplication.shared.statusBarStyle = UIColor(red: 1/255, green:18/255, blue: 35/255, alpha:1)
        
        changeStatusBar()
        
        /*formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        print(result)*/
        

    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    func changeStatusBar(){
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor(red: 1/255, green:18/255, blue: 35/255, alpha:1)
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
    }
    
}
