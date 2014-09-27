//
//  FilterViewController.swift
//  Yelp
//
//  Created by Nabib El-RAHMAN on 9/22/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

protocol FilterViewControllerDelegate {
    
    func searchTermDidChange(filterViewController: FilterViewController, price: String, deal: Bool, radiusFilter: String, sortBy: String, categories: [String])
    
}

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PriceCellDelegate  {
    
    var delegate: FilterViewControllerDelegate!
    var price: String = ""
    var deal: Bool! = false
    var categories: [String]! = [String]()
    var sortBy = "0"
    var radiusFilter = ""
    
    @IBOutlet weak var filterTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterTableView.delegate = self
        filterTableView.dataSource = self
        
        var color: UIColor = UIColor(red: CGFloat(196/255.0), green: CGFloat(18/255.0), blue: CGFloat(0), alpha: CGFloat(1))
        self.navigationController?.navigationBar.barTintColor = color
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onCancelButton(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func onSearchButton(sender: UIBarButtonItem) {
        self.delegate.searchTermDidChange(self, price: price, deal: deal, radiusFilter: radiusFilter, sortBy: sortBy, categories: categories)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 4
//    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("PriceCell") as PriceCell
       // cell. = self.price
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func priceValueChanged(priceCell: PriceCell, newValue: String) {
        self.price = newValue
    }

}
