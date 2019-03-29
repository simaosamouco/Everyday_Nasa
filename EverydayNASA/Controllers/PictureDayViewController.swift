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
    
    @IBOutlet weak var textViewEx: UITextView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var activityload: NVActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        loadingAnimation()
        ServiceHelper.shared.getPicOfTheDay(completinHandler: receiveInfo)
    }
    func receiveInfo(pictureRecebida: PictureOfTheDay){
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        //navigationController?.navigationBar.barTintColor = UIColor(red: 39/255, green:44/255, blue: 78/255, alpha:1)
        
        //navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        //navigationController?.navigationBar.
        UIApplication.shared.endIgnoringInteractionEvents()
        stopAnimating()
        loadingView.isHidden = true
        print(pictureRecebida.explanation)
        let url = URL(string: pictureRecebida.url)
        do{
            let data =  try Data(contentsOf: url!)
            image.image = UIImage(data: data)
        }catch{
            print("Error: jbrweguwbeg)")
        }
        //image.adjustsImageSizeForAccessibilityContentSizeCategory = true
        
        //image.sizeThatFits(CGSize(view.widthAnchor ))
        
        titleLabel.text = pictureRecebida.title
        dateLabel.text = pictureRecebida.date
        //explanationLabel.text = pictureRecebida.explanation
        textViewEx.text = pictureRecebida.explanation
        
        
    }
    func loadingAnimation(){
        UIApplication.shared.beginIgnoringInteractionEvents()
        let rect = CGRect(x: 200,y: 200,width: 200,height: 200)
        let size = CGSize(width:170, height:170)
        startAnimating(size, message: "Loading", messageFont: UIFont(name: "Nasa", size: 40), type: NVActivityIndicatorType(rawValue: 30), color: UIColor.white, textColor: UIColor.white)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
