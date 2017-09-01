//
//  RocketTableViewController.swift
//  SampleProject
//
//  Created by chanakkya mati on 9/1/17.
//  Copyright © 2017 chanakya. All rights reserved.
//

import UIKit

class RocketTableViewController: UITableViewController {

    let rocketdataSource = RocketTableViewDataSourec()
    let dataManager = DataManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = rocketdataSource
        self.tableView.rowHeight = 44
        dataManager.fetchRocketData { (result) in
            switch result {
            case .success(let rocketArray):
                self.rocketdataSource.rocketData = rocketArray
                
            case .failure(_):
                self.rocketdataSource.rocketData.removeAll()
            }
            self.tableView.reloadData()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = self.tableView.indexPathForSelectedRow{
          let detailViewController =  segue.destination as! ViewController
          detailViewController.rocket = rocketdataSource.rocketData[index.row]
        }else{
            fatalError("segue trigerred without a selected cell")
        }
    }
 

}

class RocketTableViewDataSourec:NSObject,UITableViewDataSource {
    var rocketData = [Rocket]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rocketData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RocketCell", for: indexPath) as! RocketCellTableViewCell
        let rocket = rocketData[indexPath.row]
        cell.flightNumberLabel.text = String(rocket.flightNumber)
        cell.launchDateLabel.text = rocket.launchdate
        return cell
    }
}
