//
//  ViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 9/19/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FilterViewControllerDelegate {
   
    var businesses: [SearchResult] = [];
    
    
    @IBOutlet weak var searchTableView: UITableView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchTableView.delegate = self
        self.searchTableView.dataSource  = self
      //  self.searchTableView.rowHeight = UITableViewAutomaticDimension
       
        self.searchWithQuery("Thai")
    }
    
    private func searchWithQuery(query: String) {
        SearchResult.searchWithQuery(query, {
            (businesses: [SearchResult]!, error: NSError!) -> Void in
            
            if businesses != nil {
                self.businesses = businesses
                self.searchTableView.reloadData()
            }
            
            if error != nil {
                println(error)
            }
        })

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
        
        cell.searchResult = self.businesses[indexPath.row] as SearchResult
        
        return cell
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
        var filtersNavigationController = segue.destinationViewController as UINavigationController
        
        var filterViewController = filtersNavigationController.viewControllers[0] as FilterViewController
        filterViewController.delegate = self
    }
    
    func searchTermDidChange(filterViewController: FilterViewController, deal: Bool, radiusFilter: String, sortBy: String, categories: [String:Bool]) {
        println("Search Term Did Change")
        
    }

    
}

