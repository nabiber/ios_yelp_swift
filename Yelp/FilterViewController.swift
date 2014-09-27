//
//  FilterViewController.swift
//  Yelp
//
//  Created by Nabib El-RAHMAN on 9/22/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

protocol FilterViewControllerDelegate {
    
    func searchTermDidChange(filterViewController: FilterViewController, deal: Bool, radiusFilter: String, sortBy: String, categories: [String:Bool])
    
}

class FilterViewController: UIViewController {
    
    var delegate: FilterViewControllerDelegate!
    var deal: Bool! = false
    var categories: [String:Bool]! = [String:Bool]()
    var sortBy = "0"
    var radiusFilter = ""
    
    @IBOutlet weak var priceRatingControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

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
        self.delegate.searchTermDidChange(self, deal: deal, radiusFilter: radiusFilter, sortBy: sortBy, categories: categories)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}
