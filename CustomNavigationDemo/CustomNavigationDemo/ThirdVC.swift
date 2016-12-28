//
//  ThirdVC.swift
//  CustomNavigationDemo
//
//  Created by Yudiz Solutions Pvt.Ltd. on 28/12/16.
//  Copyright © 2016 Yudiz Solutions Pvt.Ltd. All rights reserved.
//

import UIKit

class ThirdVC: ParentVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareNavigationUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension ThirdVC{
    func prepareNavigationUI() {
        weak var weakSelf = self
        navContainer.navView.handleBlockAction { (sender, navTapped, button) in
            if navTapped == .LeftBtn1{
                let _ =  weakSelf?.navigationController?.popViewController(animated: true)
            }else if navTapped == .RightBtn1{
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
                weakSelf?.navigationController?.pushViewController(vc, animated: true)
            }else if navTapped == .RightBtn2{
                let _ =  weakSelf?.navigationController?.popToRootViewController(animated: true)
            }else if navTapped == .RightBtn3{
                let _ =  weakSelf?.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
}
