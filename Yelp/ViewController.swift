//
//  ViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 9/19/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var client: YelpClient!
    
    // You can register for Yelp API keys here: http://www.yelp.com/developers/manage_api_keys
    let yelpConsumerKey = "nUjddnVqhLB-8g3XFxLa7w"
    let yelpConsumerSecret = "MBA5pputws_K-omJ8lCkc9rgjxE"
    let yelpToken = "McUoPa8XkG8pVBoyVFgBNpqFmtzahRqW"
    let yelpTokenSecret = "VxKYwD71miWVxIjbZ_-pNvETgKc"
    
    var businesses: [SearchResult] = [];
    
    
    @IBOutlet weak var searchTableView: UITableView!
    
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchTableView.delegate = self
        self.searchTableView.dataSource  = self
        
        // Do any additional setup after loading the view, typically from a nib.
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        
        client.searchWithTerm("Thai", success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
       //    var data = JsonHelper.JSONParseDict( JsonHelper.JSONStringify(response))
        var businessesDict = (response as NSDictionary)["businesses"] as [NSDictionary]
            
        self.businesses = businessesDict.map({ (business: NSDictionary) -> SearchResult in
            SearchResult(data: business)
        })
        self.searchTableView.reloadData()

        }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
            println(error)
        }
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.businesses.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: BusinessCell = tableView.dequeueReusableCellWithIdentifier("BusinessCell") as BusinessCell
        
        var sr = self.businesses[indexPath.row] as SearchResult
        cell.addSearchResult(sr)
        
        return cell
    }
    
    
    
}

