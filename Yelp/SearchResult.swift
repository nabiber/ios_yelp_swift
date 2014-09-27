//
//  SearchResult.swift
//  Yelp
//
//  Created by Nabib El-RAHMAN on 9/22/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class SearchResult {
    
    var name: String!
    var rating: String!
    var ratingURL: NSURL!
    var ratingURLLarge: NSURL!
    var ratingURLSmall: NSURL!
    var numOfReviews: Int!
    var displayAddress: String!
    var categories: String!
    var imageUrl: NSURL!
    var neighborhood: String!
    var distance: String = "1.1 mi"
    var priceRating: String = "$$"
    
    init(data: NSDictionary) {
        self.name = data["name"] as? String
        self.rating = data["rating"] as? String
        self.ratingURL = NSURL(string: data["rating_img_url"] as String)
        self.ratingURLLarge = NSURL(string: data["rating_img_url_large"] as String)
        self.ratingURLSmall = NSURL(string: data["rating_img_url_small"] as String)
        self.imageUrl = NSURL(string: data["image_url"] as String)
        
        self.numOfReviews = data["review_count"] as? Int
        
        //diplay address
        var location = data["location"] as NSDictionary
        self.displayAddress = Helper.arrayCombine(location["display_address"] as NSArray, sep: ", ")
        self.categories = Helper.arrayCombine(data["categories"] as NSArray, sep: ", ", {(item: AnyObject)
            -> String in
                var categoryArr = item as NSArray
                return "\(categoryArr[0])"
        })
        
    }
    
    class func searchWithQuery(query: String, callback: ([SearchResult]!, NSError!) -> Void) {
        YelpClient.sharedInstance.searchWithTerm(
            query,
            success: {
                (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                // println(response)
                var results = (response as NSDictionary)["businesses"] as [NSDictionary]
                var businesses = results.map({
                    (businessDict: NSDictionary) -> SearchResult in
                    SearchResult(data: businessDict)
                })
                callback(businesses, nil)
            },
            failure: {
                (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                // println(error)
                callback(nil, error)
            }
        )
    }
       
}
