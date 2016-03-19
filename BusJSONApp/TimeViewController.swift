//
//  TimeViewController.swift
//  BusJSONApp
//
//  Created by TAKU on 2016/03/18.
//  Copyright © 2016年 TAKUApps. All rights reserved.
//

import UIKit
import FlatUIKit //フラットUI

class TimeViewController: UIViewController {
    
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //戻る
        self.Return.buttonColor = UIColor.turquoiseColor()
        self.Return.shadowColor = UIColor.greenSeaColor()
        self.Return.shadowHeight = 3.0
        self.Return.cornerRadius = 6.0
        self.Return.titleLabel?.font = UIFont.boldFlatFontOfSize(16)
        self.Return.setTitleColor(UIColor.cloudsColor(), forState: .Normal)
        self.Return.setTitleColor(UIColor.cloudsColor(), forState: .Highlighted)
        
        //高槻
        self.Takatsuki.buttonColor = UIColor.peterRiverColor()
        self.Takatsuki.shadowColor = UIColor.belizeHoleColor()
        self.Takatsuki.shadowHeight = 3.0
        self.Takatsuki.cornerRadius = 6.0
        self.Takatsuki.titleLabel?.font = UIFont.boldFlatFontOfSize(16)
        self.Takatsuki.setTitleColor(UIColor.cloudsColor(), forState: .Normal)
        self.Takatsuki.setTitleColor(UIColor.cloudsColor(), forState: .Highlighted)
        
        //富田
        self.Tonda.buttonColor = UIColor.peterRiverColor()
        self.Tonda.shadowColor = UIColor.belizeHoleColor()
        self.Tonda.shadowHeight = 3.0
        self.Tonda.cornerRadius = 6.0
        self.Tonda.titleLabel?.font = UIFont.boldFlatFontOfSize(16)
        self.Tonda.setTitleColor(UIColor.cloudsColor(), forState: .Normal)
        self.Tonda.setTitleColor(UIColor.cloudsColor(), forState: .Highlighted)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var Return: FUIButton!
    @IBOutlet weak var Takatsuki: FUIButton!
    @IBOutlet weak var Tonda: FUIButton!
    
    var message1:String!
    var message2:String!
    
    @IBAction func TakatsukiBtn(sender: FUIButton) {
    }
    
    @IBAction func TondaBtn(sender: FUIButton) {
    }
    
    func alert(){
        let alertView = FUIAlertView()
        alertView.title = "\(message1)"
        alertView.message = "\(message2)"
        alertView.addButtonWithTitle("OK")
        alertView.titleLabel!.textColor = UIColor.cloudsColor()
        alertView.titleLabel!.font = UIFont.boldFlatFontOfSize(16)
        alertView.messageLabel!.textColor = UIColor.cloudsColor()
        alertView.messageLabel!.font = UIFont.flatFontOfSize(14)
        alertView.backgroundOverlay!.backgroundColor = UIColor.cloudsColor().colorWithAlphaComponent(0.8)
        alertView.alertContainer!.backgroundColor = UIColor.midnightBlueColor()
        alertView.defaultButtonColor = UIColor.cloudsColor()
        alertView.defaultButtonShadowColor = UIColor.asbestosColor()
        alertView.defaultButtonFont = UIFont.boldFlatFontOfSize(16)
        alertView.defaultButtonTitleColor = UIColor.asbestosColor()
        alertView .show()
    }
    
    
    
}