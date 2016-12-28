//
//  CustomNavigationContainer.swift
//  CustomNavigationDemo
//
//  Created by Yudiz Solutions Pvt.Ltd. on 28/12/16.
//  Copyright © 2016 Yudiz Solutions Pvt.Ltd. All rights reserved.
//

import UIKit
let _screenSize         = UIScreen.main.bounds.size

let _heighRatio     = _screenSize.height/736
let _widthRatio     = _screenSize.width/414


// Custom Navigation style type
enum CustomNavigationBarType: Int{
    case Style1 = 0
    case Style2 = 1
    case Style3 = 2
}

// Custom Navigation button Type
enum CustomNavButton {
    case LeftBtn1
    case RightBtn1
    case RightBtn2
    case RightBtn3
}

// Structure navigation information
struct CustomNavigationSpecific {
    var barType: CustomNavigationBarType = .Style1
    var title: String           = ""
    
    var left1BtnText: String    = ""
    var right1BtnText: String   = ""
    var right2BtnText: String   = ""
    var right3BtnText: String   = ""
    
    var left1BtnHidden: Bool     = false
    var right1BtnHidden: Bool    = true
    var right2BtnHidden: Bool    = true
    var right3BtnHidden: Bool    = true
    
    var left1BadgeCount: Int  = 0
    var right1BadgeCount: Int = 0
    var right2BadgeCount: Int = 0
    var right3BadgeCount: Int = 0
    
    var left1BtnImage: UIImage?
    var right1BtnImage: UIImage?
    var right2BtnImage: UIImage?
    var right3BtnImage: UIImage?
    
}

// MARK: CustomNavigationContainer

class CustomNavigationContainer: UIControl {
    // MARK: IBInspectable variable

    //Background color Set & default clear color
    @IBInspectable var bgColor: UIColor = UIColor.clear
    
    //Navigation style Set & default style 0
    @IBInspectable var barStyle:Int {
        get {
            return self.navigationSpecific.barType.rawValue
        }
        set( styleIndex) {
            self.navigationSpecific.barType = CustomNavigationBarType(rawValue: styleIndex) ?? CustomNavigationBarType.Style1
        }
    }
    
    //Navigation title Set
    @IBInspectable var title: String {
        get {
            return self.navigationSpecific.title
        }
        set( str) {
            self.navigationSpecific.title =   str
        }
    }
    
    //Navigation buttons title Inspectable variable

    @IBInspectable var left1BtnText: String {
        get {
            return self.navigationSpecific.left1BtnText
        }
        set( title) {
            self.navigationSpecific.left1BtnText =   title
        }
    }
    
    @IBInspectable var right1BtnText: String {
        get {
            return self.navigationSpecific.right1BtnText
        }
        set( title) {
            self.navigationSpecific.right1BtnText =   title
        }
    }
    
    @IBInspectable var right2BtnText: String {
        get {
            return self.navigationSpecific.right2BtnText
        }
        set( title) {
            self.navigationSpecific.right2BtnText =   title
        }
    }
    
    @IBInspectable var right3BtnText: String {
        get {
            return self.navigationSpecific.right3BtnText
        }
        set( title) {
            self.navigationSpecific.right3BtnText =   title
        }
    }
    
    //Navigation buttons hide/show Inspectable variable

    @IBInspectable var left1BtnHiden: Bool  {
        get {
            return self.navigationSpecific.left1BtnHidden
        }
        set( new) {
            self.navigationSpecific.left1BtnHidden =   new
        }
    }
    
    @IBInspectable var right1BtnHidden: Bool   {
        get {
            return self.navigationSpecific.right1BtnHidden
        }
        set( new) {
            self.navigationSpecific.right1BtnHidden =   new
        }
    }
    
    @IBInspectable var right2BtnHidden: Bool  {
        get {
            return self.navigationSpecific.right2BtnHidden
        }
        set( new) {
            self.navigationSpecific.right2BtnHidden =   new
        }
    }
    
    @IBInspectable var right3BtnHidden: Bool   {
        get {
            return self.navigationSpecific.right3BtnHidden
        }
        set( new) {
            self.navigationSpecific.right3BtnHidden =   new
        }
    }
    
    //Navigation badge count Inspectable variable

    @IBInspectable var left1BadgeCount: Int   {
        get {
            return self.navigationSpecific.left1BadgeCount
        }
        set( new) {
            self.navigationSpecific.left1BadgeCount =   new
        }
    }
    
    @IBInspectable var right1BadgeCount: Int   {
        get {
            return self.navigationSpecific.right1BadgeCount
        }
        set( new) {
            self.navigationSpecific.right1BadgeCount =   new
        }
    }
    
    @IBInspectable var right2BadgeCount: Int    {
        get {
            return self.navigationSpecific.right2BadgeCount
        }
        set( new) {
            self.navigationSpecific.right2BadgeCount =   new
        }
    }
    
    @IBInspectable var right3BadgeCount: Int   {
        get {
            return self.navigationSpecific.right3BadgeCount
        }
        set( new) {
            self.navigationSpecific.right3BadgeCount =   new
        }
    }
    
    //Navigation buttons image set Inspectable variable

    @IBInspectable var left1BtnImage: UIImage? {
        get {
            return self.navigationSpecific.left1BtnImage
        }
        set( new) {
            self.navigationSpecific.left1BtnImage =   new
        }
    }
    
    @IBInspectable var right1BtnImage: UIImage? {
        get {
            return self.navigationSpecific.right1BtnImage
        }
        set( new) {
            self.navigationSpecific.right1BtnImage =   new
        }
    }
    
    @IBInspectable var right2BtnImage: UIImage? {
        get {
            return self.navigationSpecific.right2BtnImage
        }
        set( new) {
            self.navigationSpecific.right2BtnImage =   new
        }
    }
    
    @IBInspectable var right3BtnImage: UIImage? {
        get {
            return self.navigationSpecific.right3BtnImage
        }
        set( new) {
            self.navigationSpecific.right3BtnImage =   new
        }
    }
    
    
    var navView: CustomNavigationBar!
    var navigationSpecific = CustomNavigationSpecific()
    var barType:CustomNavigationBarType = .Style1
    
    // MARK: initialize

    override func awakeFromNib() {
        super.awakeFromNib()
        
        navView = CustomNavigationBar.initializeViewFromNib(navigationSpecific)
        navView.backgroundColor = self.bgColor
        self.addSubview(navView)
        
        let top = NSLayoutConstraint(item: navView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
        let buttom = NSLayoutConstraint(item: navView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
        let trail = NSLayoutConstraint(item: navView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0)
        let lead = NSLayoutConstraint(item: navView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)
        
        navView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([top,buttom,trail,lead])
    }
    
}

// MARK: CustomNavigationBar

class CustomNavigationBar: ConstrainedControl{
    
    @IBOutlet var lblTitle:UILabel!
    @IBOutlet var btnLeft1:UIButton!
    @IBOutlet var lblLeft1Badge:UILabel!
    
    @IBOutlet var lblRight1Badge:UILabel!
    @IBOutlet var lblRight2Badge:UILabel!
    @IBOutlet var lblRight3Badge:UILabel!
    
    @IBOutlet var btnRight1:UIButton!
    @IBOutlet var btnRight2:UIButton!
    @IBOutlet var btnRight3:UIButton!
    
    var actionBlock: ((_ sender: CustomNavigationBar,_ navTapped: CustomNavButton,_ button:UIButton) -> ())?
    
    // MARK: initialize
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
    }
    
    // MARK: initialize NiB

    class func initializeViewFromNib(_ objNav: CustomNavigationSpecific) -> CustomNavigationBar {
        switch objNav.barType {
        case .Style1:
            let obj = Bundle.main.loadNibNamed("CustomNavBarStyle1", owner: nil, options: nil)![0] as! CustomNavigationBar
            obj.prepareUI(objNav)
            return obj
        case .Style2:
            let obj = Bundle.main.loadNibNamed("CustomNavBarStyle2", owner: nil, options: nil)![0] as! CustomNavigationBar
            obj.prepareUI(objNav)
            return obj
        case .Style3:
            let obj = Bundle.main.loadNibNamed("CustomNavBarStyle3", owner: nil, options: nil)![0] as! CustomNavigationBar
            obj.prepareUI(objNav)
            return obj
        }
    }
   
    
    // MARK: Method
    func handleBlockAction(block: @escaping (_ sender: CustomNavigationBar,_ navTapped: CustomNavButton, _ button:UIButton) -> ()){
        actionBlock = block
    }
    
    func prepareUI(_ objNav: CustomNavigationSpecific){
        self.lblTitle.text          = objNav.title
        
        self.lblLeft1Badge.isHidden   = objNav.left1BadgeCount == 0
        self.lblRight1Badge.isHidden  = objNav.right1BadgeCount == 0
        
        self.lblLeft1Badge.text     = "\(objNav.left1BadgeCount)"
        self.lblRight1Badge.text    = "\(objNav.right1BadgeCount)"
        
        self.btnLeft1.isHidden = objNav.left1BtnHidden
        self.btnRight1.isHidden = objNav.right1BtnHidden
        self.btnLeft1.setImage(objNav.left1BtnImage, for: .normal)
        self.btnRight1.setImage(objNav.right1BtnImage, for: .normal)
        
        self.btnLeft1.setTitle(objNav.left1BtnText, for: .normal)
        self.btnRight1.setTitle(objNav.right1BtnText, for: .normal)
        
        switch objNav.barType {
        case .Style2:
            self.lblRight2Badge.text    = "\(objNav.right2BadgeCount)"
            
            self.lblRight2Badge.isHidden  = objNav.right2BadgeCount == 0
            
            self.btnRight2.isHidden       = objNav.right2BtnHidden
            
            self.btnRight2.setImage(objNav.right2BtnImage, for: .normal)
            self.btnRight2.setTitle(objNav.right2BtnText, for: .normal)
            
            break
            
        case .Style3:
            self.lblRight2Badge.text    = "\(objNav.right2BadgeCount)"
            self.lblRight3Badge.text    = "\(objNav.right3BadgeCount)"
            
            self.lblRight2Badge.isHidden  = objNav.right2BadgeCount == 0
            self.lblRight3Badge.isHidden  = objNav.right3BadgeCount == 0
            
            self.btnRight2.setImage(objNav.right2BtnImage, for: .normal)
            self.btnRight2.setTitle(objNav.right2BtnText, for: .normal)
            
            self.btnRight3.setImage(objNav.right3BtnImage, for: .normal)
            self.btnRight3.setTitle(objNav.right3BtnText, for: .normal)
            
            self.btnRight2.isHidden       = objNav.right2BtnHidden
            self.btnRight2.isHidden       = objNav.right3BtnHidden
            break
            
        default:
            break
        }
    }
    
}
// MARK: Button Actions
extension CustomNavigationBar {
    @IBAction func btnLeft1Tapped(_ sender: UIButton){
        actionBlock?(self, .LeftBtn1, sender)
    }
    
    
    @IBAction func btnRight1Tapped(_ sender: UIButton){
        actionBlock?(self, .RightBtn1, sender)
    }
    
    @IBAction func btnRight2Tapped(_ sender: UIButton){
        actionBlock?(self, .RightBtn2, sender)
    }
    
    @IBAction func btnRight3Tapped(_ sender: UIButton){
        actionBlock?(self, .RightBtn3, sender)
    }
    
}




/// This View contains collection of Horizontal and Vertical constrains. Who's constant value varies by size of device screen size.
class ConstrainedControl: UIControl {
    
    // MARK: Outlets
    @IBOutlet var horizontalConstraints: [NSLayoutConstraint]?
    @IBOutlet var verticalConstraints: [NSLayoutConstraint]?
    
    // MARK: Awaken
    override func awakeFromNib() {
        super.awakeFromNib()
        constraintUpdate()
    }
    
    func constraintUpdate() {
        if let hConts = horizontalConstraints {
            for const in hConts {
                let v1 = const.constant
                let v2 = v1 * _widthRatio
                const.constant = v2
            }
        }
        if let vConst = verticalConstraints {
            for const in vConst {
                let v1 = const.constant
                let v2 = v1 * _heighRatio
                const.constant = v2
            }
        }
    }
}

class RoundedCountLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.bounds.size.height/2
        self.layer.masksToBounds = true
    }
}
