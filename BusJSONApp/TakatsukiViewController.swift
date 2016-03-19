//
//  TakatsukiViewController.swift
//  BusJSONApp
//
//  Created by TAKU on 2016/03/19.
//  Copyright © 2016年 TAKUApps. All rights reserved.
//

import UIKit
import FlatUIKit //フラットUI

class TakatsukiViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //完了
        self.OK.buttonColor = UIColor.turquoiseColor()
        self.OK.shadowColor = UIColor.greenSeaColor()
        self.OK.shadowHeight = 3.0
        self.OK.cornerRadius = 6.0
        self.OK.titleLabel?.font = UIFont.boldFlatFontOfSize(16)
        self.OK.setTitleColor(UIColor.cloudsColor(), forState: .Normal)
        self.OK.setTitleColor(UIColor.cloudsColor(), forState: .Highlighted)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var OK: FUIButton!

    
    
}
