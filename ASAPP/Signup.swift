//
//  Signup.swift
//  ASAPP
//
//  Created by 钟镇阳 on 11/6/15.
//  Copyright © 2015 ZhenyangZhong. All rights reserved.
//

import UIKit
import CoreData

class Signup: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var aboutMeLabel: UILabel!
    
//    @IBOutlet var usernameLabel: UILabel!
    
    @IBOutlet var usernameField: UITextField!
    
//    @IBOutlet var passwordLabel: UILabel!
    
    @IBOutlet var passwordField: UITextField!
    
//    @IBOutlet var addressLabel: UILabel!
    
    @IBOutlet var addressField: UITextField!
    
    @IBOutlet var addressPicker: UIPickerView!
    
    @IBOutlet var genderLabel: UILabel!
    
    @IBOutlet var maleLabel: UILabel!
    
    @IBOutlet var genderSwitch: UISwitch!
    
    @IBOutlet var backButton: UIButton!
    
//    @IBOutlet var ethnLabel: UILabel!
    
    @IBOutlet var ethnPicker: UIPickerView!
    
    @IBOutlet var birthLabel: UILabel!
    
    @IBOutlet var birthPicker: UIDatePicker!
    
    @IBOutlet var graduationLabel: UILabel!
    
    @IBOutlet var yearLabel: UILabel!
    
    @IBOutlet var yearSlider: UISlider!
    
    @IBOutlet var confirmButton: UIButton!
    
//    @IBOutlet var SATLabel: UILabel!
    
    @IBOutlet var SATField: UITextField!
    
//    @IBOutlet var ACTLabel: UILabel!
    
    @IBOutlet var ACTField: UITextField!
    
    @IBOutlet var scroll: UIScrollView!
    
    
    var addressList:NSDictionary!
    
    var ethnList:NSArray!
    
    
    
    @IBAction func confirmAction(sender: AnyObject){
        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDel.managedObjectContext
        
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context)
    
        newUser.setValue(usernameField.text!, forKey: "username")
        newUser.setValue(passwordField.text!, forKey: "password")
        
        do {
            try newUser.managedObjectContext?.save()
        }
        catch {
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func switchGender(sender: AnyObject) {
        if genderSwitch.on {
            maleLabel.text = getWord("male")
        }
        else {
            maleLabel.text = getWord("female")
        }
    }
    
    @IBAction func slideYear(sender: AnyObject) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signupVC = self
        initLabel()
        initPicker()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scroll.contentSize.height = 700
        scroll.alwaysBounceVertical = false
    }
    
    @IBAction func backAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    private func initLabel(){
        aboutMeLabel.text = getWord("about_me")
        usernameField.placeholder = getWord("username")
        passwordField.placeholder = getWord("password")
//        addressLabel.text = getWord("address")
        addressField.placeholder = getWord("city")
        genderLabel.text = getWord("gender")
        maleLabel.text = getWord("male")
//        ethnLabel.text = getWord("ethnicity")
        backButton.setTitle(getWord("back"), forState: UIControlState.Normal)
        birthLabel.text = getWord("birthdate")
        graduationLabel.text = getWord("graduation")
        yearLabel.text = "2016"
        yearSlider.minimumValue = 0;
        yearSlider.maximumValue = 10;
        yearSlider.setValue(0, animated: true)
        SATField.placeholder = getWord("sat_score")
        ACTField.placeholder = getWord("act_score")
        confirmButton.setTitle(getWord("confirm"), forState: UIControlState.Normal)
    }
    
    private func initPicker(){
        addressList = readPlist("address")
        addressPicker.selectRow(0, inComponent: 0, animated: true)
        addressPicker.delegate = self
        addressPicker.dataSource = self
        ethnList = readArrayPlist("ethnList")
        ethnPicker.selectRow(0, inComponent: 0, animated: true)
        ethnPicker.delegate = self
        ethnPicker.dataSource = self
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        if pickerView == addressPicker {
            if component == 0 {
                return (addressList.allKeys[row] as! String)
            }
            else {
                let val = (addressList.allValues[pickerView.selectedRowInComponent(0)] as! Array<String>)[row]
                return val
            }
        }
        else if pickerView == ethnPicker {
            return ethnList[row] as? String
        }
        return ""
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        if pickerView == addressPicker {
            return 2
        }
        else {
            return 1
        }
    }
    
    // returns the # of rows in each component..
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if pickerView == addressPicker {
            if component == 0 {
                return addressList.count
            }
            else {
                return (addressList.allValues[pickerView.selectedRowInComponent(0)] as! NSArray).count
            }
        }
        else if pickerView == ethnPicker{
            return ethnList.count
        }
        return 0;
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if pickerView == addressPicker{
            pickerView.reloadComponent(1)
        }
    }
}
