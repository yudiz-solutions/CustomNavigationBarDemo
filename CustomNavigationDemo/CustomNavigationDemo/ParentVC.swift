//
//  ParentVC.swift
//  CustomNavigationDemo
//
//  Created by Yudiz Solutions Pvt.Ltd. on 28/12/16.
//  Copyright © 2016 Yudiz Solutions Pvt.Ltd. All rights reserved.
//

import UIKit

class ParentVC: UIViewController {
    @IBOutlet var navContainer :  CustomNavigationContainer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
