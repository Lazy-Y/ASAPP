//
//  ViewController.swift
//  ASAPP
//
//  Created by 钟镇阳 on 11/6/15.
//  Copyright © 2015 ZhenyangZhong. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBAction func login(sender: AnyObject) {
        let board = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = board.instantiateViewControllerWithIdentifier("tabbar") as! UITabBarController
        self.presentViewController(vc, animated: true, completion: nil)
        self.showViewController(vc, sender: self)
//        saveCollege()
//        print(readCollege())
//        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
//        let context = appDel.managedObjectContext
//        
//        let request = NSFetchRequest(entityName: "User")
//        request.returnsObjectsAsFaults = false
//        
//        var results:NSArray?
//        do {
//            results = try context.executeFetchRequest(request)
//            print("successfully load data")
//            print(results)
//        }
//        catch {
//            print("Error loading data")
//        }
//        
//        if results?.count > 0 {
//            usernameField.text = (results![results!.count-1] as! User).username
//            passwordField.text = (results![results!.count-1] as! User).password
//            
//        }
//        else {
//            print("Empty data")
//        }

    }
    
    
    
    @IBOutlet var usernameLabel: UILabel!
    
    @IBOutlet var passwordLabel: UILabel!

    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var signupButton: UIButton!

    @IBOutlet var usernameField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loginVC = self
        
        language_setting = 0
        
        dictionary = readPlist("label")
        
        initLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func initLabel(){
        usernameLabel.text = getWord("username")
        passwordLabel.text = getWord("password")
        loginButton.setTitle(getWord("login"), forState: UIControlState.Normal)
        signupButton.setTitle(getWord("signup"), forState: UIControlState.Normal)
    }

    static func setNotification(year:Int,month:Int,day:Int,hour:Int,minute:Int,msg:String){
        let dateComp = NSDateComponents()
        dateComp.year = year
        dateComp.month = month
        dateComp.day = day
        dateComp.hour = hour
        dateComp.minute = minute
        dateComp.timeZone = NSTimeZone.systemTimeZone()
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let date = calendar?.dateFromComponents(dateComp)
        let notification = UILocalNotification()
        notification.category = "FIRST_CATEGORY"
        notification.alertBody = msg
        notification.fireDate = date
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
//    func readFromTxt()->NSData{
//        let location = "/Users/ZhenyangZhong/Desktop/college.txt"
//        var data = NSData()
//        do {
//            let fileContent = try NSString(contentsOfFile: location, encoding: NSUTF8StringEncoding)
//            let arr = fileContent.componentsSeparatedByString("\n")
//            var info = Array<Array<String>>()
//            for str in arr{
//                info.append((str as String).componentsSeparatedByString("\t"))
//            }
//            var result = [[String]](count: info[0].count, repeatedValue:[String](count: info.count, repeatedValue: ""))
//            for i in 0..<info.count{
//                for j in 0..<info[0].count{
//                    result[j][i] = info[i][j]
//                }
//            }
//            var dic = Dictionary<String,Dictionary<String,String>>()
//            for i in 1..<result.count{
//                var temp = Dictionary<String,String>()
//                for j in 0..<result[i].count{
//                    temp[result[0][j]] = result[i][j]
//                }
//                temp[College.ranking] = String(i)
//                dic[result[i][0]] = temp
//            }
//            do {
//                data = try json_encode(dic)
//            }
//        }
//        catch {
//            
//        }
//        return data
//    }
//    
//    func saveCollege(){
//        let data = readFromTxt()
//        
//        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
//        let context = appDel.managedObjectContext
//        
//        let newCollege = NSEntityDescription.insertNewObjectForEntityForName("College", inManagedObjectContext: context)
//        
//        newCollege.setValue(data, forKey: "info")
//        newCollege.setValue(2016, forKey: "year")
//        
//        do {
//            try newCollege.managedObjectContext?.save()
//        }
//        catch {
//        }
//    }
//    
//    static func readCollege()->Dictionary<String,Dictionary<String,String>>{
//        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
//        let context = appDel.managedObjectContext
//        let request = NSFetchRequest(entityName: "College")
//        request.returnsObjectsAsFaults = false
//        
//        var results:NSArray?
//        do {
//            results = try context.executeFetchRequest(request)
//            print("successfully load data")
//            print(results)
//        }
//        catch {
//            print("Error loading data")
//        }
//        let info = (results?[(results?.count)!-1] as! College).info
//        do {
//         return try json_decode(info!)
//        }
//        catch {}
//        return Dictionary<String,Dictionary<String,String>>()
//    }
}

