//
//  PictureDayViewController.swift
//  NASADaily
//
//  Created by Simão Samouco on 25/03/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class PictureDayViewController: UIViewController, NVActivityIndicatorViewable {

    
    //10,33+ 9,61
    
    @IBOutlet weak var imageBig: UIImageView!
    @IBOutlet weak var textViewEx: UITextView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var activityload: NVActivityIndicatorView!
    let tapRec = UITapGestureRecognizer()
    
    var yearReceived:String!
    var monthReceived:String!
    var dayReceived: String!
    
   // let bigImage = UIImageView()
    
    /*let imageBig = UIImage(named: imageName)
    let imageViewBig = UIImageView(image: image!)*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        //navigationController?.navigationBar.barTintColor = UIColor(red: 100/255,green: 100/255, blue: 100/255, alpha:0)
        
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(smallImageTapped(tapGestureRecognizer:)))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizerr = UITapGestureRecognizer(target: self, action: #selector(bigImageTapped(tapGestureRecognizer:)))
        imageBig.isUserInteractionEnabled = true
        imageBig.addGestureRecognizer(tapGestureRecognizerr)
        
        
        loadingAnimation()
        if yearReceived == nil{
            ServiceHelper.shared.getPicOfTheDay(completinHandler: receiveInfo)
        }else{
            ServiceHelper.shared.getAsteroidsOfTheSelectedDay(day: dayReceived, month: monthReceived, year: yearReceived, completinHandler: receiveInfo)
        }
        
        //let defaults = UserDefaults.standard
       // let lann = defaults.string(forKey: "Language")
        //print(lann)
        //self.navigationController?.navigationBar.isTranslucent = false;
       // self.navigationController?.navigationBar.
        
        textViewEx.isEditable = false
        
       /* view.addSubview(bigImage)
        bigImage.bringSubview(toFront: view)
        bigImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bigImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bigImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bigImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true*/
 
    }
    
    override func viewDidLayoutSubviews() {
        self.navigationController?.navigationBar.isTranslucent = false;
    }
    
    func receiveInfo(pictureRecebida: PictureOfTheDay){
        let alert = UIAlertController(title: "", message: "Tap de Image to make it bigger", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        /*self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true*/
        //navigationController?.navigationBar.barTintColor = UIColor(red: 39/255, green:44/255, blue: 78/255, alpha:1)
        
        //navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        //navigationController?.navigationBar.
        UIApplication.shared.endIgnoringInteractionEvents()
        stopAnimating()
        loadingView.isHidden = true
        //print(pictureRecebida.explanation)
        let url = URL(string: pictureRecebida.url)
        do{
            let data =  try Data(contentsOf: url!)
            image.image = UIImage(data: data)
           // bigImage.image = UIImage(data: data)
            imageBig.image = UIImage(data: data)
            
        }catch{
            print("Error: jbrweguwbeg)")
        }
        //image.adjustsImageSizeForAccessibilityContentSizeCategory = true
        
        //image.sizeThatFits(CGSize(view.widthAnchor ))
        
        titleLabel.text = pictureRecebida.title
        dateLabel.text = pictureRecebida.date
        //explanationLabel.text = pictureRecebida.explanation
        textViewEx.text = pictureRecebida.explanation
        
        imageBig.isHidden = true
        
        
    }
    func loadingAnimation(){
        UIApplication.shared.beginIgnoringInteractionEvents()
        let rect = CGRect(x: 200,y: 200,width: 200,height: 200)
        let size = CGSize(width:170, height:170)
        startAnimating(size, message: "Loading", messageFont: UIFont(name: "Nasa", size: 40), type: NVActivityIndicatorType(rawValue: 30), color: UIColor.white, textColor: UIColor.white)
        
    }
    @objc func smallImageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        print("small image tapped")
        //imageBig.isHidden = false
        loadingView.isHidden = false
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.imageBig.isHidden = false
            self.navigationController?.setNavigationBarHidden(true, animated: false)
        })
    }
    
    @objc func bigImageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        print("big image tapped")
        //imageBig.isHidden = true
        loadingView.isHidden = true
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.navigationController?.setNavigationBarHidden(false, animated: false)
            self.imageBig.isHidden = true
        })
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
