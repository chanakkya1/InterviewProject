//
//  ViewController.swift
//  SampleProject
//
//  Created by chanakkya mati on 9/1/17.
//  Copyright © 2017 chanakya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var detailsLabel: UILabel!
    @IBOutlet var flightNoLable: UILabel!
    @IBOutlet var launchdatelabel: UILabel!
    var rocket:Rocket!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsLabel.text = rocket.details
        launchdatelabel.text = rocket.launchdate
        flightNoLable.text = String(rocket.flightNumber)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

