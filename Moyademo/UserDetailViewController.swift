//
//  detailViewController.swift
//  Moyademo
//
//  Created by Shivani Pathak on 02/09/16.
//  Copyright © 2016 Shivani Pathak. All rights reserved.
//

import UIKit
import Kingfisher
import Moya_ObjectMapper

class UserDetailViewController: UIViewController {
    var data:String!
    var datadic:NSMutableDictionary=NSMutableDictionary()
    
    @IBOutlet weak var lbl_name: UILabel!
    
    @IBOutlet weak var lbl_updated_at: UILabel!
    @IBOutlet weak var lbl_created_at: UILabel!
    @IBOutlet weak var lbl_following: UILabel!
    @IBOutlet weak var lbl_followers: UILabel!
    @IBOutlet weak var lbl_public_gists: UILabel!
    @IBOutlet weak var lbl_public_repos: UILabel!
    @IBOutlet weak var lbl_bio: UILabel!
    @IBOutlet weak var lbl_hireable: UILabel!
    @IBOutlet weak var lbl_email: UILabel!
    @IBOutlet weak var lbl_location: UILabel!
    @IBOutlet weak var lbl_blog: UILabel!
    @IBOutlet weak var lbl_company: UILabel!
    @IBOutlet weak var profile: UIImageView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        self.getdetaildata(data)

        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getdetaildata(username:String) {
        GitHubProvider.request(.UserProfile(username), completion: { result in
            
            var success = true
            var message = "Unable to fetch from GitHub"
            
            switch result {
            case let .Success(response):
                do {
                       if let json = try response.mapJSON() as? NSMutableDictionary
                    {
                        let url=NSURL(string: (json.objectForKey("avatar_url") as? String)!)
                     self.lbl_name.text=json.objectForKey("name") as? String
                      self.profile.kf_showIndicatorWhenLoading=true
                        self.profile.kf_setImageWithURL(url, placeholderImage: nil, optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                        self.lbl_company.text=json.objectForKey("company") as? String
                        self.lbl_blog.text=json.objectForKey("blog") as? String
                        self.lbl_location.text=json.objectForKey("location") as? String
                        self.lbl_email.text=json.objectForKey("email") as? String
                        self.lbl_hireable.text=json.objectForKey("hireable") as? String
                        self.lbl_bio.text=json.objectForKey("bio") as? String
                        self.lbl_public_repos.text=json.objectForKey("public_repos") as? String
                        self.lbl_public_gists.text=json.objectForKey("public_gists") as? String
                        self.lbl_followers.text="\(json.objectForKey("followers") as! Int)"
                        self.lbl_following.text="\(json.objectForKey("following") as! Int)"
                        self.lbl_created_at.text=json.objectForKey("created_at") as? String
                        self.lbl_updated_at.text=json.objectForKey("updated_at") as? String
                    }
                    }
                catch
                {
                    success = false
                }
            //                self.tableView.reloadData()
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
    
  
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
