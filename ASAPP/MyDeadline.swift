//
//  MyDeadline.swift
//  ASAPP
//
//  Created by 钟镇阳 on 11/25/15.
//  Copyright © 2015 ZhenyangZhong. All rights reserved.
//

import CoreData
import UIKit

class MyDeadline: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .SingleLine
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return myDeadlineDic.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        cell?.textLabel?.text = (myDeadlineDic[indexPath.row][0] as! String) + "\t\t" + String(myDeadlineDic[indexPath.row][2] as! Int) + "\t" + (myDeadlineDic[indexPath.row][1] as! String)
        return cell!
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            myDeadlineDic.removeAtIndex(indexPath.row)
            table.reloadData()
        }
    }
}
