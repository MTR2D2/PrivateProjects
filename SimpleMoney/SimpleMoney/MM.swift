//
//  MichaelsMoneyVC.swift
//  BuiltBeautiful
//
//  Created by Michael Reynolds on 12/7/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import QuartzCore

var userName: String?
var balance: Double?

// MARK: - NextVC

class NextVC: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nameTextField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if nameTextField.text != ""
        {
            userName = nameTextField.text!
            
            performSegueWithIdentifier("EnterNameSegue", sender: nil)
        }
        return true
    }
    
}

// MARK: - ChooseVC

class ChooseVC: UIViewController//, UIPopoverPresentationControllerDelegate
{
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var incomeButton: UIButton!
    @IBOutlet weak var expenseButton: UIButton!
    @IBOutlet weak var myMoneyButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        userLabel.text = "\(userName!)'s Money"
        
        self.incomeButton.layer.cornerRadius = 8
        self.expenseButton.layer.cornerRadius = 8
        self.myMoneyButton.layer.cornerRadius = 8
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func instantiateIncomeVC()
        {
            let destVC = storyboard?.instantiateViewControllerWithIdentifier("IncomeVC") as! IncomeVC
            presentViewController(destVC, animated: true, completion: nil)
        }
    
    func instantiateMyMoneyVC()
    {
        let destVC = storyboard?.instantiateViewControllerWithIdentifier("MyMoneyVC") as! MyMoneyVC
        presentViewController(destVC, animated: true, completion: nil)
    }
    
    @IBAction func incomeTapped(sender: UIButton!)
    {
        instantiateIncomeVC()
    }
    
    @IBAction func myMoneyTapped(sender: UIButton!)
    {
        instantiateMyMoneyVC()
    }
    
}

// MARK: - MyMoneyVC

class MyMoneyVC: UIViewController
{
    
    @IBOutlet weak var addNewButton: UIButton!
    @IBOutlet weak var totalBalance: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.addNewButton.layer.cornerRadius = 8
        
        totalBalance.text = "\(balance!)"
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func instantiateChooseVC()
    {
        let destVC = storyboard?.instantiateViewControllerWithIdentifier("ChooseVC") as! ChooseVC
        presentViewController(destVC, animated: true, completion: nil)
    }
    
    @IBAction func addNewTapped(sender: UIButton!)
    {
        instantiateChooseVC()
    }
    
}

// MARK: - IncomeVC

class IncomeVC: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet weak var incomeTextField: UITextField!
    @IBOutlet weak var myMoneyButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.myMoneyButton.layer.cornerRadius = 8
        
        incomeTextField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
//    {
//        if segue.identifier == "Income2MoneySegue"
//        {
//            let destVC = segue.destinationViewController as? MyMoneyVC
//            destVC?.currentBalance = incomeTextField.text
//        }
//    }

    func instantiateMyMoneyVC()
        {
            let destVC = storyboard?.instantiateViewControllerWithIdentifier("MyMoneyVC") as! MyMoneyVC
            balance = Double(incomeTextField.text!)
            presentViewController(destVC, animated: true, completion: nil)
        }
    
    @IBAction func myMoneyTapped(sender: UIButton!)
    {
        instantiateMyMoneyVC()
    }
    
    @IBAction func nextTapped(sender: UIButton!)
    {
        instantiateMyMoneyVC()
    }
    
//    let myMoneyVC = navigationController.viewControllers[0] as! MyMoneyVC
//    myMoneyVC.slkdjfaldkjf;
}

// MARK: - ExpenseVC

class ExpenseVC: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var expenseTextField: UITextField!
    @IBOutlet weak var myMoneyButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.myMoneyButton.layer.cornerRadius = 8
        
        expenseTextField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func instantiateMyMoneyVC()
    {
        let destVC = storyboard?.instantiateViewControllerWithIdentifier("MyMoneyVC") as! MyMoneyVC
        balance = Double(expenseTextField.text!)
        presentViewController(destVC, animated: true, completion: nil)
    }
    
    @IBAction func myMoneyTapped(sender: UIButton!)
    {
        instantiateMyMoneyVC()
    }
    
    @IBAction func nextTapped(sender: UIButton!)
    {
        instantiateMyMoneyVC()
    }
    
}
