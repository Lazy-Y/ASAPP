//
//  CollegeProfile.swift
//  ASAPP
//
//  Created by 钟镇阳 on 11/28/15.
//  Copyright © 2015 ZhenyangZhong. All rights reserved.
//

import UIKit

class CollegeProfile: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var SchoolName: UILabel!
    
    @IBOutlet var detail: UILabel!
    
    @IBOutlet var decision: UILabel!
    
    @IBOutlet var fees: UILabel!
    
    @IBOutlet var application: UILabel!
    
    @IBOutlet var score: UILabel!
    
    @IBOutlet var enroll: UILabel!
    
    @IBOutlet var red: UILabel!
    
    @IBOutlet var redLong: UILabel!
    
    @IBOutlet var blue: UILabel!
    
    @IBOutlet var blueLong: UILabel!
    
    @IBOutlet var blackLong: UILabel!
    
    @IBOutlet var black: UILabel!
    
    @IBOutlet var purpleLong: UILabel!

    @IBOutlet var purple: UILabel!
    
    @IBOutlet var pinkLong: UILabel!
    
    @IBOutlet var pink: UILabel!
    
    @IBOutlet var orangeLong: UILabel!
    
    @IBOutlet var orange: UILabel!
    
    @IBOutlet var greenLong: UILabel!
    
    @IBOutlet var green: UILabel!
    
    @IBOutlet var contact: UILabel!
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print(red.frame.width)
    }
  
    var image:String!
    var info:Dictionary<String,String>!
    
    func setInfo(image:String, info:Dictionary<String,String>){
        self.image = image
        self.info = info
    }
    func init_view(){
        imageView.image = UIImage(named: image)
        SchoolName.text = info[College.college]!
        detail.numberOfLines = 0
        detail.lineBreakMode = NSLineBreakMode.ByWordWrapping
        detail.text = "\t"+info[College.location]!+"\n\t"+info[College.website]!+"\n\t"+info[College.application_fee]!+" Application Fee"
        decision.lineBreakMode = .ByCharWrapping
        var text = ""
        if info[College.ED] != ""{
            text += "\tEarly Decision:\t" + info[College.ED]! + "\n"
        }
        if info[College.ED2] != ""{
            text += "\tEarly Decision II:\t" + info[College.ED2]! + "\n"
        }
        if info[College.EA] != ""{
            text += "\tEarly Action:\t" + info[College.EA]! + "\n"
        }
        if info[College.RD] != ""{
            text += "\tRegular Decision:\t" + info[College.RD]! + "\n"
        }
        decision.text = text
        
        fees.numberOfLines = 3
        fees.lineBreakMode = .ByWordWrapping
        text = "\tTuition:\t" + info[College.tuition]! + "\n" + "\tRoom and Board:\t" + info[College.room]! + "\n"
        if info[College.resident] != ""{
            text += ("\tResident:\t" + info[College.resident]!)
        }
        fees.text = text
        
        application.numberOfLines = 4
        application.lineBreakMode = .ByWordWrapping
        application.text = "\tStudents Applied:\t" + info[College.applied]! + "\n\tStudents Admitted:\t" + info[College.admitted]! + "\n\tStudents Enrolled:\t" + info[College.enrolled]! + "\n\tUndergrad Admission Rate:\t" + info[College.admission_rate]!
        
        score.lineBreakMode = .ByWordWrapping
        score.numberOfLines = 2
        score.text = "\tSAT:\t" + info[College.SAT]! + "\n\tACT:\t" + info[College.ACT]!
        
        enroll.numberOfLines = 3
        enroll.lineBreakMode = .ByWordWrapping
        enroll.text = "\tUndergraduate:\t" + info[College.undergrad]! + "\n\tGraduate:\t" + info[College.graduate]! + "\n\tTotal Students:\t" + info[College.total_students]!
        
        
        var str = info[College.american_indian]!
        red.text = str
        str.removeAtIndex(str.endIndex.predecessor())
        redLong.text = ""
        var size = Double(str)!
        redLong.addConstraint(NSLayoutConstraint(item: redLong, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: redLong, attribute: .Width, multiplier: 0.5, constant: CGFloat(size*2)))
        
        str = info[College.asian]!
        blue.text = str
        str.removeAtIndex(str.endIndex.predecessor())
        blueLong.text = ""
        
        size = Double(str)!
        blueLong.addConstraint(NSLayoutConstraint(item: blueLong, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: blueLong, attribute: .Width, multiplier: 0.5, constant: CGFloat(size*2)))
        
        
        str = info[College.black]!
        black.text = str
        str.removeAtIndex(str.endIndex.predecessor())
        blackLong.text = ""
        
        size = Double(str)!
        blackLong.addConstraint(NSLayoutConstraint(item: blackLong, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: blackLong, attribute: .Width, multiplier: 0.5, constant: CGFloat(size*2)))
        
        
        str = info[College.hispanic]!
        purple.text = str
        str.removeAtIndex(str.endIndex.predecessor())
        purpleLong.text = ""
        
        size = Double(str)!
        purpleLong.addConstraint(NSLayoutConstraint(item: purpleLong, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: purpleLong, attribute: .Width, multiplier: 0.5, constant: CGFloat(size*2)))
        
        
        str = info[College.white]!
        pink.text = str
        str.removeAtIndex(str.endIndex.predecessor())
        pinkLong.text = ""
        
        size = Double(str)!
        pinkLong.addConstraint(NSLayoutConstraint(item: pinkLong, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: pinkLong, attribute: .Width, multiplier: 0.5, constant: CGFloat(size*2)))
        
        
        str = info[College.other]!
        orange.text = str
        str.removeAtIndex(str.endIndex.predecessor())
        orangeLong.text = ""
        
        size = Double(str)!
        print("Size ", size)
        orangeLong.addConstraint(NSLayoutConstraint(item: orangeLong, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: orangeLong, attribute: .Width, multiplier: 0.5, constant: CGFloat(size*2)))
        
        
        
        str = info[College.international]!
        if str == ""{
            str = "0.0%"
        }
        print(str)
        green.text = str
        str.removeAtIndex(str.endIndex.predecessor())
        greenLong.text = ""
        
        size = Double(str)!
        greenLong.addConstraint(NSLayoutConstraint(item: greenLong, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: greenLong, attribute: .Width, multiplier: 0.5, constant: CGFloat(size*2)))
        
        contact.numberOfLines = 0
        contact.lineBreakMode = .ByWordWrapping
        contact.text = "\tGeneral Information:\t" + info[College.gereral]! + "\n\tAdmission Office:\t\t" + info[College.admssion_office]!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "College Profile"
        init_view()
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
