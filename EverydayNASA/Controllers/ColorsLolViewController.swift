//
//  ColorsLolViewController.swift
//  EverydayNASA
//
//  Created by Simão Samouco on 01/04/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import UIKit

class ColorsLolViewController: UIViewController {

    @IBOutlet weak var redCoisoo: UISlider!
    
    @IBOutlet weak var blueCoisoo: UISlider!
    @IBOutlet weak var greenCoisoo: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        redCoisoo.maximumValue = 255
        redCoisoo.minimumValue = 0
        
        blueCoisoo.maximumValue = 255
        blueCoisoo.minimumValue = 0
        
        greenCoisoo.maximumValue = 255
        greenCoisoo.minimumValue = 0
        
        /*view.backgroundColor = UIColor(red: CGFloat(redCoiso.value/255), green:CGFloat(greenCoiso.value/255), blue: CGFloat(blueCoiso.value/255), alpha:1)*/
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func redCoisoo(_ sender: UISlider) {
        view.backgroundColor = UIColor(red: CGFloat(sender.value/255), green:CGFloat(greenCoisoo.value/255), blue: CGFloat(blueCoisoo.value/255), alpha:1)
        //changeColor()
    }
    
    @IBAction func greenCoisoo(_ sender: UISlider) {
       view.backgroundColor = UIColor(red: CGFloat(redCoisoo.value/255), green:CGFloat(sender.value/255), blue: CGFloat(blueCoisoo.value/255), alpha:1)
        //changeColor()
    }
    
    @IBAction func blueCoisoo(_ sender: UISlider) {
        view.backgroundColor = UIColor(red: CGFloat(redCoisoo.value/255), green:CGFloat(greenCoisoo.value/255), blue: CGFloat(sender.value/255), alpha:1)
        //changeColor()
    }
    
    func changeColor(){
        view.backgroundColor = UIColor(red: CGFloat(redCoisoo.value/255), green:CGFloat(greenCoisoo.value/255), blue: CGFloat(blueCoisoo.value/255), alpha:1)

    }
    /*
    func restartApplication () {
        let viewController = LaunchScreenViewController(nibName: "MenuViewController", bundle: nil)
        
        let navCtrl = UINavigationController(rootViewController: viewController)
        
        guard
            let window = UIApplication.shared.keyWindow,
            let rootViewController = window.rootViewController
            else {
                return
        }
        
        navCtrl.view.frame = rootViewController.view.frame
        navCtrl.view.layoutIfNeeded()
        
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
            window.rootViewController = navCtrl
        })
        
    }
 */
}
