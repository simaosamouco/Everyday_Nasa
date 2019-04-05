//
//  MenuViewController.swift
//  NASADaily
//
//  Created by Simão Samouco on 25/03/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var chooseImg: UIButton!
    @IBOutlet weak var lotsAsteroids: UIButton!
    @IBOutlet weak var picDay: UIButton!
    let date = Date()
    let formatter = DateFormatter()
    override func viewDidLoad() {
        let defaults = UserDefaults.standard
        //UserDefaults.standard.set("pt", forKey: "AppleLanguages")
        //UserDefaults.standard.synchronize()
        
        /*
        if defaults.string(forKey: "Language") == "enn"{
            UserDefaults.standard.set("en", forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        }else if defaults.string(forKey: "Language") == "ptt"{
            UserDefaults.standard.set("pt", forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        }*/
        print(UserDefaults.standard.string(forKey: "AppleLanguages"))
        
        
        
        super.viewDidLoad()
        //let defaults = UserDefaults.standard
       // defaults.set("enn", forKey: "Language")
        
        
        changeStatusBar()
        let x = NSLocalizedString("button_picday", comment: "")
        picDay.setTitle(x, for: .normal)
        
        let y = NSLocalizedString("button_lotsAsteroids", comment: "")
        lotsAsteroids.setTitle(y, for: .normal)
        
        let z = NSLocalizedString("button_ChooseImage", comment: "")
        chooseImg.setTitle(z, for: .normal)
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
    
    
    @IBAction func goToChooseDate(_ sender: Any) {
        performSegue(withIdentifier: "segueChooseDate", sender: self)
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
    
    @IBAction func goToSettings(_ sender: Any) {
        performSegue(withIdentifier: "segueToSettings", sender: nil)
    }
}
