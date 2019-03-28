//
//  ListAsteroidViewController.swift
//  NASADaily
//
//  Created by Simão Samouco on 27/03/2019.
//  Copyright © 2019 Simão Samouco. All rights reserved.
//

import UIKit

class ListAsteroidViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var asteroidsToUse: AsteroidsResonse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ServiceHelper.shared.getAsteroidsOfTheDay(completinHandler: receiveInfo)
        
    }
    
    func receiveInfo(asteroidsReceived: AsteroidsResonse){
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
    
}
