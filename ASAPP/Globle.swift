//
//  Globle.swift
//  ASAPP
//
//  Created by 钟镇阳 on 11/7/15.
//  Copyright © 2015 ZhenyangZhong. All rights reserved.
//

import Foundation
import UIKit


var loginVC:ViewController?
var signupVC:Signup?

var myDeadlineDic = [["Havard","days",10],["Yale","days",15],["Princton","days",18]]

//let college_info = ViewController.readCollege()
let college_info = readFromPlist()



//func json_encode(dic:Dictionary<String,Dictionary<String,String>>)throws->NSData{
//    let data = try NSJSONSerialization.dataWithJSONObject(dic, options: NSJSONWritingOptions(rawValue: 0))
//    print(NSString(data: data, encoding: NSUTF8StringEncoding))
//    return data
//}
//
func json_decode(data:NSData)throws->Dictionary<String,Dictionary<String,String>>{
//    print(NSString(data: data, encoding: NSUTF8StringEncoding))
    return try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0)) as! Dictionary<String,Dictionary<String,String>>
}

func readFromPlist()->Dictionary<String,Dictionary<String,String>>{
    var result:Dictionary<String,Dictionary<String,String>>!
    if let path = NSBundle.mainBundle().pathForResource("SchoolInfo", ofType: "plist") {
        let dic = NSDictionary(contentsOfFile: path)
        let str = dic!["info"] as! NSString
        do {
            result = try json_decode(str.dataUsingEncoding(NSUTF8StringEncoding)!)
        }
        catch {
            
        }
    }
    return result
}
    