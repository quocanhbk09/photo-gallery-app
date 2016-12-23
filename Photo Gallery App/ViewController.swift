//
//  ViewController.swift
//  Photo Gallery App
//
//  Created by Quoc Anh Tran on 12/22/16.
//  Copyright © 2016 Anh Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationBar.setTitleVerticalPositionAdjustment(10, for: UIBarMetrics.default)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

