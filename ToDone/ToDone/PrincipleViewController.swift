//
//  PrincipleViewController.swift
//  ToDone
//
//  Created by Michael Reynolds on 1/14/16.
//  Copyright © 2016 Michael Reynolds. All rights reserved.
//

import UIKit

class PrincipleViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var timerCount = 0
    
    @IBOutlet weak var bigButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doPressed(sender: UIButton) {
//        self.performSegueWithIdentifier("toTabBar", sender: self)
//        buttonChanges()
    }
    
//    func buttonChanges() {
//        timerCount++
//        if timerCount % 2 == 1
//        {
//            bigButton.setImage(UIImage(named:"Done"), forState:. Normal)
//        }
//        else
//        {
//            bigButton.setImage(UIImage(named: "Do"), forState: .Normal)
//        }

//    }
    
    // MARK: - UIPopoverPresentationController Delegate
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return UIModalPresentationStyle.None
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "textViewSegue"
        {
            bigButton.setImage(UIImage(named:"Done"), forState:. Normal)

            let destVC = segue.destinationViewController as! EnterTextViewController
            destVC.popoverPresentationController?.delegate = self
            destVC.delegate = self
            destVC.preferredContentSize = CGSizeMake(410.0, 216.0)
        }
    }
    

}
