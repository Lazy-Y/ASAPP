//
//  language.swift
//  ASAPP
//
//  Created by 钟镇阳 on 11/6/15.
//  Copyright © 2015 ZhenyangZhong. All rights reserved.
//

import Foundation

var language_setting:Int!
//
//let username_label = ["Username","用户名"]
//let password_label = ["Password","密码"]
//let login_button = ["Login","登录"]

var dictionary: NSDictionary!

func getWord(word:String)->String{
    return (dictionary[word] as! Array<String>)[language_setting]
}

func readPlist(name:String)->NSDictionary{
    let path = NSBundle.mainBundle().pathForResource(name, ofType: "plist")
    return NSDictionary(contentsOfFile: path!)!
}

func readArrayPlist(name:String)->NSArray{
    let path = NSBundle.mainBundle().pathForResource(name, ofType: "plist")
    return NSArray(contentsOfFile: path!)!
}
