//
//  ViewController.swift
//  customRefresh
//
//  Created by Robin Malhotra on 27/06/15.
//  Copyright © 2015 Robin Malhotra. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate
{
    let data=["one","two","three","four","five"]
    let tableView=UITableView()
    let refreshHeight=CGFloat(100.0)
    let customRefreshControl=CustomRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame=view.frame
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.delegate=self
        tableView.dataSource=self
        customRefreshControl.frame=CGRectMake(0.0, -refreshHeight, self.view.frame.width, refreshHeight)
        tableView.addSubview(customRefreshControl)
        // Do any additional setup after loading the view.
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool)
    {
        customRefreshControl.containingScrollViewDidStopScrolling(scrollView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCellWithIdentifier("cell")
        cell?.textLabel?.text=data[indexPath.row]
        return cell!
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
