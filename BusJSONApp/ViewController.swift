//
//  ViewController.swift
//  BusJSONApp
//
//  Created by TAKU on 2016/03/14.
//  Copyright © 2016年 TAKUApps. All rights reserved.
//
//jsonデータは各値の終端に0を代入
//また上から平日、平日(学級日除外)、土曜日、日曜日

import UIKit
import FlatUIKit //フラットUI
import SwiftyJSON //JSONの取り扱い

class ViewController: UIViewController {
    
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //高槻Btn
        self.TakatsukiBtn.buttonColor = UIColor.turquoiseColor()
        self.TakatsukiBtn.shadowColor = UIColor.greenSeaColor()
        self.TakatsukiBtn.shadowHeight = 3.0
        self.TakatsukiBtn.cornerRadius = 6.0
        self.TakatsukiBtn.titleLabel?.font = UIFont.boldFlatFontOfSize(16)
        self.TakatsukiBtn.setTitleColor(UIColor.cloudsColor(), forState: .Normal)
        self.TakatsukiBtn.setTitleColor(UIColor.cloudsColor(), forState: .Highlighted)
        
        //富田Btn
        self.TondaBtn.buttonColor = UIColor.turquoiseColor()
        self.TondaBtn.shadowColor = UIColor.greenSeaColor()
        self.TondaBtn.shadowHeight = 3.0
        self.TondaBtn.cornerRadius = 6.0
        self.TondaBtn.titleLabel?.font = UIFont.boldFlatFontOfSize(16)
        self.TondaBtn.setTitleColor(UIColor.cloudsColor(), forState: .Normal)
        self.TondaBtn.setTitleColor(UIColor.cloudsColor(), forState: .Highlighted)
        
        //最短
        self.Time.buttonColor = UIColor.alizarinColor()
        self.Time.shadowColor = UIColor.pomegranateColor()
        self.Time.shadowHeight = 3.0
        self.Time.cornerRadius = 6.0
        self.Time.titleLabel?.font = UIFont.boldFlatFontOfSize(16)
        self.Time.setTitleColor(UIColor.cloudsColor(), forState: .Normal)
        self.Time.setTitleColor(UIColor.cloudsColor(), forState: .Highlighted)
        
        //スイッチ
        self.ControllLabal.selectedFont = UIFont.boldFlatFontOfSize(16)
        self.ControllLabal.selectedFontColor = UIColor.cloudsColor()
        self.ControllLabal.deselectedFont = UIFont.flatFontOfSize(16)
        self.ControllLabal.deselectedFontColor = UIColor.cloudsColor()
        self.ControllLabal.selectedColor = UIColor.amethystColor()
        self.ControllLabal.deselectedColor = UIColor.midnightBlueColor()
        self.ControllLabal.cornerRadius = 20.0
        
        
        //使い方
        self.HowUseBtn.buttonColor = UIColor.peterRiverColor()
        self.HowUseBtn.shadowColor = UIColor.belizeHoleColor()
        self.HowUseBtn.shadowHeight = 3.0
        self.HowUseBtn.cornerRadius = 6.0
        self.HowUseBtn.titleLabel?.font = UIFont.boldFlatFontOfSize(16)
        self.HowUseBtn.setTitleColor(UIColor.cloudsColor(), forState: .Normal)
        self.HowUseBtn.setTitleColor(UIColor.cloudsColor(), forState: .Highlighted)
        
        //このアプリについて
        self.About.buttonColor = UIColor.carrotColor()
        self.About.shadowColor = UIColor.pumpkinColor()
        self.About.shadowHeight = 3.0
        self.About.cornerRadius = 6.0
        self.About.titleLabel?.font = UIFont.boldFlatFontOfSize(16)
        self.About.setTitleColor(UIColor.cloudsColor(), forState: .Normal)
        self.About.setTitleColor(UIColor.cloudsColor(), forState: .Highlighted)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var TakatsukiBtn: FUIButton! //高槻
    @IBOutlet weak var TondaBtn: FUIButton! //富田
    @IBOutlet weak var ControllLabal: FUISegmentedControl! //スイッチ
    @IBOutlet weak var HowUseBtn: FUIButton! //使い方
    @IBOutlet weak var About: FUIButton! //このアプリについて
    @IBOutlet weak var Time: FUIButton! //最短
    @IBOutlet weak var Label: UILabel! //表示
    
    
    var month:Int = 0 //月
    var day:Int = 0 //日
    var hour:Int = 0 //時間
    var min:Int = 0 //分
    var week:Int = 0 //曜日
    var tmp:String! //駅名
    var weekday:Int = 0 //曜日判定
    var message1:String! //タイトル
    var message2:String! //メッセージ
    var num:Int = 0 //スイッチ
    var i:Int = 0 //カウンタ
    var cnt:Int = 0 //カウンタ
    var stop:Int = 0 //カウンタ
    var changeID:Int = 0 //行き先変更
    var plus:Int = 0 //調整
    var special:Int = 0 //祝日
    var id1:Int = 0 //高槻
    var id2:Int = 0 //富田
    
    @IBAction func TakatsukiAction(sender: FUIButton) { //高槻
        getTime()
        message1 = "高槻"
        if((2 <= week && week <= 6) && ((0 <= hour && hour <= 6) || (22 <= hour && 20 <= min))){ //平日の運行時間外
            message2 = "現在バスは運行していません"
        } else if (week == 7 && ((0 <= hour && hour <= 6) || (21 <= hour && 31 <= min))){ //土曜日の運行時間外
            message2 = "現在バスは運行していません"
        } else if ((week == 1 || special == 1) && ((0 <= hour && hour <= 6) || (17 <= hour && 11 <= min))){//日曜日の運行時間外
            message2 = "現在バスは運行していません"
        } else {
            tmp = "Takatsuki"
            judge()
        }
        alert()
    }
    
    @IBAction func TondaAction(sender: FUIButton) { //富田
        getTime()
        message1 = "富田"
        if ((2 <= week && week <= 6) && ((0 <= hour && hour <= 5) || (22 <= hour && 32 <= min))){
            message2 = "現在バスは運行していません"
        } else if (week == 7 && ((0 <= hour && hour <= 6) || (hour == 22 && 9 <= min))){
            message2 = "現在バスは運行していません"
        } else if ((week == 1 || special == 1) && ((0 <= hour && hour <= 6) || (hour == 22 && 3 <= min))){
            message2 = "現在バスは運行していません"
        } else {
            tmp = "Tonda"
            judge()
        }
        alert()
    }
    
    @IBAction func Controll(sender: FUISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            num = 0
        } else if (sender.selectedSegmentIndex == 1){
            num = 1
        }
    }

    @IBAction func Timeshcedule(sender: FUIButton) { //最短
        getTime()
        if((2 <= week && week <= 6) && ((0 <= hour && hour <= 6) || (22 <= hour && 20 <= min))){ //高槻平日の運行時間外
            id1 = -1
        } else if (week == 7 && ((0 <= hour && hour <= 6) || (21 <= hour && 31 <= min))){ //高槻土曜日の運行時間外
            id1 = -1
        } else if ((week == 1 || special == 1) && ((0 <= hour && hour <= 6) || (17 <= hour && 11 <= min))){//高槻日曜日の運行時間外
            id1 = -1
        } else {
            tmp = "Takatsuki"
            judge2()
            cnt += 1
        }
        if ((2 <= week && week <= 6) && ((0 <= hour && hour <= 5) || (22 <= hour && 32 <= min))){
            id2 = -1
        } else if (week == 7 && ((0 <= hour && hour <= 6) || (hour == 22 && 9 <= min))){
            id2 = -1
        } else if ((week == 1 || special == 1) && ((0 <= hour && hour <= 6) || (hour == 22 && 3 <= min))){
            id2 = -1
        } else {
            tmp = "Tonda"
            judge2()
            cnt = 0
        }
        judge3()
        
    }
    

    @IBAction func HowuseAction(sender: FUIButton) { //使い方
        message1 = "使い方"
        message2 = "各駅のボタンを押すと、現在時刻を取得して各駅の次のバスとの\n出発時間の差をお知らせします。「最短でバスに乗る」は両駅が\n検索対象です。"
        alert()
    }


    @IBAction func AbouAction(sender: FUIButton) { //このアプリについて
        message1 = "このアプリについて"
        message2 = "Copyright (c) 2016 TAKU.\nAll rights reserved."
        alert()
    }
    
    func getTime(){ //時間取得
        let date = NSDate()
        let cal = NSCalendar.currentCalendar()
        let comp = cal.components([NSCalendarUnit.Month, NSCalendarUnit.Day,  NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Weekday],fromDate: date)
        month = comp.month
        day = comp.day
        hour = comp.hour
        min = comp.minute
        week = comp.weekday
        if((month == 1 && (day == 1 || day == 11)) || (month == 2 && day == 11) || (month == 3 && (day == 20 || day == 21)) || (month == 4 && day == 29) || (month == 5 && (3 <= day && day <= 5)) || (month == 7 && day == 18) || (month == 9 && day == 19) || (month == 10 && day == 10) || (month == 11 && (day == 3 && day == 23)) && (month == 12 && day == 23)){
            special = 1
        }
    }
    
    func judge(){ //JSONデータ、判断
        let path : String = NSBundle.mainBundle().pathForResource("\(tmp)", ofType: "json")!
        let fileHandle : NSFileHandle = NSFileHandle(forReadingAtPath: path)!
        let data : NSData = fileHandle.readDataToEndOfFile()
        let json = JSON(data: data)
        if(week == 1 || special == 1){ //日曜日
            weekday = 3
        }else if (2 <= week && week <= 6){ //平日
            weekday = 0
            if(num == 1){ //学級日除外
                weekday = 1
            }
        } else if (week == 7){ //土曜日
            weekday = 2
        }
        while(true){
            let id = json["Nomal"][weekday]["\(hour)"][i].int
            if (min == id){
                message1 = "出発時刻です"
                message2 = "次のバスは1分後に確認できます"
                break
            } else if (min < id! + plus){
                message2 = "次のバスは\((id! - min) + plus)分後です。"
                plus = 0
                i = 0
                special = 0
                break
            } else if (id == 0){
                plus = 60
                hour += 1
                i = 0
                continue
            }
            i += 1
        }
    }
    
    func judge2(){
        let path : String = NSBundle.mainBundle().pathForResource("\(tmp)", ofType: "json")!
        let fileHandle : NSFileHandle = NSFileHandle(forReadingAtPath: path)!
        let data : NSData = fileHandle.readDataToEndOfFile()
        let json = JSON(data: data)
        if(week == 1 || special == 1){ //日曜日
            weekday = 3
        }else if (2 <= week && week <= 6){ //平日
            weekday = 0
            if(num == 1){ //学級日除外
                weekday = 1
            }
        } else if (week == 7){ //土曜日
            weekday = 2
        }
        while(true){
            var id = json["Nomal"][weekday]["\(hour)"][i].int
            if (min == id){
                if(cnt == 0){
                    id1 = 0
                    cnt += 1
                } else if (cnt == 1){
                    id2 = 0
                }
                break
            } else if (min < id! + plus){
                if(cnt == 0){
                    id1 = (Int(id!) + plus) - min
                } else if (cnt == 1){
                    id2 = (Int(id!) + plus) - min
                }
                i = 0
                special = 0
                break
            } else if (id == 0){
                plus = 60
                hour += 1
                i = 0
                continue
            }
            i += 1
        }
    }
    
    func judge3(){
        if(id1 == -1 && id2 == -1){ //両方運行時間外
            message1 = ""
            message2 = "現在両駅ともに運行していません"
            stop = 1
        } else if (id1 != -1 && id2 == -1){ //富田運行時間外
            message1 = "富田は運行時間外です"
            message2 = "高槻で次のバスは\(id1)分後です"
            if(id1 == 0){
                message2 = "高槻は出発時間です"
            }
            stop = 1
        } else if (id1 == -1 && id2 != -1){
            message1 = "高槻は運行時間外です"
            message2 = "富田で次のバスは\(id2)分後です"
            if(id2 == 0){
                message2 = "富田は出発時間です"
            }
            stop = 1
        } else if(stop == 0 && id1 > id2){
            message1 = "最短"
            message2 = "最短は富田で\(id2)分後です"
        } else if(stop == 0 && id1 < id2){
            message1 = "最短"
            message2 = "最短は高槻で\(id1)分後です"
        }
        alert()
        stop = 0
        plus = 0
    }
    
    func alert(){ //アラート
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

