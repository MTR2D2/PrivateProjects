//
//  SecondViewController.swift
//  ToDone
//
//  Created by Michael Reynolds on 1/14/16.
//  Copyright © 2016 Michael Reynolds. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController//, UITableViewDataSource, UITableViewDelegate
{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
//     func numberOfSectionsInTableView(tableView: UITableView) -> Int
//    {
//        return 1
//    }
//    
//     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//        return heroes.count
//    }
//    
//    
//     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
//    {
//        let cell = tableView.dequeueReusableCellWithIdentifier("HeroCell", forIndexPath: indexPath)
//        
//        let aHero = heroes[indexPath.row]
//        cell.textLabel?.text = aHero.name
//        cell.detailTextLabel?.text = aHero.homeworld
//        
//        return cell
//    }
//    
//     func tableView(tableview: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
//    {
//        tableview.deselectRowAtIndexPath(indexPath, animated: true)
//        
//        let selectedHero = heroes[indexPath.row]
//        let detailVC = storyboard?.instantiateViewControllerWithIdentifier("HeroDetailViewController") as! HeroDetailViewController
//        detailVC.hero = selectedHero
//        navigationController?.pushViewController(detailVC, animated: true)
//    }


}

