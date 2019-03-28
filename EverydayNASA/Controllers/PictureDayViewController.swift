//
//  PictureDayViewController.swift
//  NASADaily
//
//  Created by Simão Samouco on 25/03/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import UIKit

class PictureDayViewController: UIViewController {

    @IBOutlet weak var imgLoad: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "night_sky")!)
        ServiceHelper.shared.getPicOfTheDay(completinHandler: receiveInfo)
    }
    func receiveInfo(pictureRecebida: PictureOfTheDay){
       // imgLoad.isHidden = true
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
        explanationLabel.text = pictureRecebida.explanation
        
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
