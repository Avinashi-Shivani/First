//
//  ViewController.swift
//  Moyademo
//
//  Created by Shivani Pathak on 01/09/16.
//  Copyright © 2016 Shivani Pathak. All rights reserved.
//

import UIKit
import Moya_ObjectMapper
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


     var repos = [User]()
   
    @IBOutlet weak var datatable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datatable.rowHeight=UITableViewAutomaticDimension
        datatable.estimatedRowHeight=200
        self.getdata()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - API Stuff
    
    func getdata() {
        GitHubProvider.request(.users, completion: { result in
            
            var success = true
            var message = "Unable to fetch from GitHub"
            
            switch result {
            case let .Success(response):
                do {
                    let repos: [User]? = try response.mapArray(User)
                    if let repos = repos
                    {
                      
                        self.repos = repos
                        print("the data---->",self.repos)
                        self.datatable.reloadData()
                    }
                    else
                    {
                        success = false
                    }
                }
                catch
                {
                    success = false
                }

            case let .Failure(error):
                guard let error = error as? CustomStringConvertible else {
                    break
                }
                message = error.description
                success = false
            }
            
            if !success {
                let alertController = UIAlertController(title: "GitHub Fetch", message: message, preferredStyle: .Alert)
                let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                    alertController.dismissViewControllerAnimated(true, completion: nil)
                })
                alertController.addAction(ok)
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        })
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let cell=tableView.dequeueReusableCellWithIdentifier("cell") as! TableViewCell
        let user = repos[indexPath.row]
    let url=NSURL(string: user.avatar_url)!
        cell.profile_pic.kf_showIndicatorWhenLoading=true
        cell.profile_pic.kf_setImageWithURL(url, placeholderImage: nil, optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        cell.lbl_stationname.text=user.name
        cell.lbl_buildyear.text=user.avatar_url
    
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let myvc=storyboard?.instantiateViewControllerWithIdentifier("detailViewController") as! UserDetailViewController
        myvc.data=repos[indexPath.row].name
        self.navigationController?.pushViewController(myvc, animated: true)
        
    }

}

