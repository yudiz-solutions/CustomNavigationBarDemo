//
//  SecondVC.swift
//  CustomNavigationDemo
//
//  Created by Yudiz Solutions Pvt.Ltd. on 28/12/16.
//  Copyright © 2016 Yudiz Solutions Pvt.Ltd. All rights reserved.
//

import UIKit

class SecondVC: ParentVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareNavigationUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


extension SecondVC{
    func prepareNavigationUI() {
        weak var weakSelf = self
        navContainer.navView.handleBlockAction { (sender, navTapped, button) in
            if navTapped == .LeftBtn1{
                let _ =  weakSelf?.navigationController?.popViewController(animated: true)
            }else if navTapped == .RightBtn1{
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdVC") as! ThirdVC
                weakSelf?.navigationController?.pushViewController(vc, animated: true)
            }else if navTapped == .RightBtn2{
                let _ =  weakSelf?.navigationController?.popToRootViewController(animated: true)
            }
        }
        
    }
}

// MARK: Button Actions
extension SecondVC{
    @IBAction func btnCountPlusAction(_ sender: UIButton){
        navContainer.right1BadgeCount += 1
        navContainer.navView.prepareUI(navContainer.navigationSpecific)
    }

    @IBAction func btnCountMinusAction(_ sender: UIButton){
        if navContainer.right1BadgeCount == 0 {
            return;
        }
        navContainer.right1BadgeCount -= 1
        navContainer.navView.prepareUI(navContainer.navigationSpecific)

    }
}
