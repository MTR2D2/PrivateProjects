//
//  EnterTextViewController.swift
//  ToDone
//
//  Created by Michael Reynolds on 1/14/16.
//  Copyright © 2016 Michael Reynolds. All rights reserved.
//

import UIKit

class EnterTextViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: PrincipleViewController?
//    let arrayOfItems: NSArray?
    var newString: String = ""
    var overthere: FirstViewController?

    

    
    @IBOutlet weak var doTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        doTextField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        delegate!.bigButton.setImage(UIImage(named:"Do"), forState:. Normal)

    }
    
    // MARK: - UITextField delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if doTextField.text != ""
        {
            newString = doTextField.text!
            doTextField.resignFirstResponder()
            performSegueWithIdentifier("toTabBar", sender: nil)
        }
        else
        {
            doTextField.becomeFirstResponder()
        }
        return true
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toTabBar"
        {
            overthere?.newString = newString
        }
    }

}
