//
//  MainTabBar.swift
//  ASAPP
//
//  Created by 钟镇阳 on 11/25/15.
//  Copyright © 2015 ZhenyangZhong. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {

    func setControllers(){
        let board1 = UIStoryboard(name: "DeadlineList", bundle: NSBundle.mainBundle())
        let vc1 = board1.instantiateViewControllerWithIdentifier("first") as! UINavigationController
        self.presentViewController(vc1, animated: true, completion: nil)
        let board2 = UIStoryboard(name: "MyDeadline", bundle: NSBundle.mainBundle())
        let vc2 = board2.instantiateViewControllerWithIdentifier("first") as! UINavigationController
        self.presentViewController(vc2, animated: true, completion: nil)
        let arr = [vc1,vc2]
        vc1.tabBarItem.title = "Schools"
        vc2.tabBarItem.title = "Deadline"
        self.setViewControllers(arr, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setControllers()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
