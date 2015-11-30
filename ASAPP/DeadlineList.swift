//
//  DeadlineList.swift
//  ASAPP
//
//  Created by 钟镇阳 on 11/6/15.
//  Copyright © 2015 ZhenyangZhong. All rights reserved.
//

import UIKit

class DeadlineList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var table: UITableView!
    
    var schoolList:Array<Dictionary<String,String>>{
        let count:Int = college_info.count
        var array = [Dictionary<String,String>](count: count, repeatedValue: Dictionary<String,String>())
        for (_,val) in college_info{
            array[Int(val[College.ranking]!)!-1] = val
        }
        return array
    }
    
    let Schools = [
        ("Havard University","CA"),
        ("Standford University","CA"),
        ("Columbia University","NY"),
        ("Vanderbilt University","NY")
    ];
    
    let DeadLine = [
        ("1","2"),
        ("3","4"),
        ("5","4"),
        ("7","10")
    ];
    
    //Return how many columns in the list
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    
    //Return how many rows are in the list
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return schoolList.count
    }
    
    //Wh at are the contents of each cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell();
//        var (SchoolName, SchoolLocation) = Schools[indexPath.row];
//        var (EA, ED) = DeadLine[indexPath.row];
//        
//        cell.textLabel?.text = SchoolName + EA;
        
        let cell:CustomizedDeadlineListCell = self.table.dequeueReusableCellWithIdentifier("DeadlineListCell") as! CustomizedDeadlineListCell
        
//        let (Name, Location) = Schools[indexPath.row];
//        let (EA, RD) = DeadLine[indexPath.row];
        cell.SchoolImage.image = UIImage(named: String(indexPath.row%5));
        cell.SchoolName.text = schoolList[indexPath.row][College.college]
        var type = "Admission Types: "
        if schoolList[indexPath.row][College.RD] != ""{
            type += "RD/"
        }
        if schoolList[indexPath.row][College.ED] != ""{
            type += "ED/"
        }
        if schoolList[indexPath.row][College.EA] != ""{
            type += "EA/"
        }
        if schoolList[indexPath.row][College.ED2] != ""{
            type += "ED2/"
        }
        if type.characters.last == "/"{
            type.removeAtIndex(type.endIndex.predecessor())
        }
        
        cell.type.text = type
        cell.rate.text = "Acceptance Rates: " + schoolList[indexPath.row][College.admission_rate]!
        return cell;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90;
    }
    //add title
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "School                             Types                            Deadlines";
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
        
        //set up the CustomizedDeadlineCell
        let nib = UINib(nibName: "DeadlineListCell", bundle: nil)
        
        table.registerNib(nib, forCellReuseIdentifier: "DeadlineListCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let board = UIStoryboard(name: "DeadlineList", bundle: NSBundle.mainBundle())
        let profile = board.instantiateViewControllerWithIdentifier("CollegeProfile") as! CollegeProfile
        profile.setInfo(String(indexPath.row%5), info: schoolList[indexPath.row])
        self.navigationController?.pushViewController(profile, animated: true)
        
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
