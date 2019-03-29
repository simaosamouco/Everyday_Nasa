//
//  ListAsteroidViewController.swift
//  NASADaily
//
//  Created by Simão Samouco on 27/03/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ListAsteroidViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NVActivityIndicatorViewable{

    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var activityload: NVActivityIndicatorView!
    var asteroidToSend: Asteroid!
    
    let screenSize: CGRect = UIScreen.main.bounds
    let myView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    var asteroidsToUse: AsteroidsResonse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        loadingAnimation()
        ServiceHelper.shared.getAsteroidsOfTheDay(completinHandler: receiveInfo)
        myView.isHidden = true
        
    }
    
    func receiveInfo(asteroidsReceived: AsteroidsResonse){
        stopAnimating()
        myView.isHidden = true
        myView.removeFromSuperview()
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        DispatchQueue.main.async {
            self.asteroidsToUse = asteroidsReceived
            print("miss distance kilometers:  \(asteroidsReceived.results[0].closeApproach[0].missDistance.kilometers)")
            
            self.tableView.reloadData()
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return asteroidsToUse != nil ? asteroidsToUse.results.count : 0
        //return 3
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellID") as! TableViewCell
        
        //cell.nomeLabel.text = self.asteroidsToUse.results[indexPath].name
        cell.nomeLabel.text = self.asteroidsToUse.results[indexPath.row].name
        cell.absolute_MagnitudeLabel.text = String(self.asteroidsToUse.results[indexPath.row].absolute_magnitude)
        cell.km_secLabel.text = self.asteroidsToUse.results[indexPath.row].closeApproach[0].relativeVelocity.kilometersPerSecond
        cell.orbiting_bodyLabel.text = self.asteroidsToUse.results[indexPath.row].closeApproach[0].orbiting_body
        
        if(indexPath.row % 2 == 0)
        {
            cell.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 75/255, alpha: 1)
            //cell.backgroundColor = UIColor.lightGray
        } else {
            cell.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 63/255, alpha: 1)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        asteroidToSend = asteroidsToUse.results[indexPath.row]
        performSegue(withIdentifier: "segueToPerfil", sender: indexPath)
        /*let controller = segue.destination as? PerfilViewController
        controller?.characterEscolhido = enviar*/
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToPerfil" {
            
            let controller = segue.destination as? PerfilAsteroidViewController
            controller?.asteroidReceived = asteroidToSend
        }else if segue.identifier == "segueMenu"{
            print("JINGLE BELLS")
        }
    }
    
    
    func loadingAnimation(){
        let size = CGSize(width:170, height:170)
        startAnimating(size, message: "Loading", messageFont: UIFont(name: "Nasa", size: 40), type: NVActivityIndicatorType(rawValue: 30), color: UIColor.white, textColor: UIColor.white)
       /* let screenSize: CGRect = UIScreen.main.bounds
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        myView.backgroundColor = UIColor(red: 39/255, green:44/255, blue: 78/255, alpha:1)
        self.view.addSubview(myView)*/
        
    }
    
}
