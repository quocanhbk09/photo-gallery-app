//
//  SettingViewController.swift
//  Photo Gallery App
//
//  Created by Quoc Anh Tran on 12/25/16.
//  Copyright © 2016 Anh Tran. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
