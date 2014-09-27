//
//  YelpClient.swift
//  Yelp
//
//  Created by Timothy Lee on 9/19/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class YelpClient: BDBOAuth1RequestOperationManager {
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class var sharedInstance : YelpClient {
    struct Static {
        static var token : dispatch_once_t = 0
        static var instance : YelpClient? = nil
        }
        dispatch_once(&Static.token) {
            Static.instance = YelpClient(
                consumerKey: "nUjddnVqhLB-8g3XFxLa7w",
                consumerSecret: "MBA5pputws_K-omJ8lCkc9rgjxE",
                accessToken: "McUoPa8XkG8pVBoyVFgBNpqFmtzahRqW",
                accessSecret: "VxKYwD71miWVxIjbZ_-pNvETgKc"
            )
        }
        return Static.instance!
    }
    
    init(consumerKey key: String!, consumerSecret secret: String!, accessToken: String!, accessSecret: String!) {
        var baseUrl = NSURL(string: "http://api.yelp.com/v2/")
        super.init(baseURL: baseUrl, consumerKey: key, consumerSecret: secret);
        
        var token = BDBOAuthToken(token: accessToken, secret: accessSecret, expiration: nil)
        self.requestSerializer.saveAccessToken(token)
    }
    
    func searchWithTerm(term: String, success: (AFHTTPRequestOperation!, AnyObject!) -> Void, failure: (AFHTTPRequestOperation!, NSError!) -> Void) -> AFHTTPRequestOperation! {
        // For additional parameters, see http://www.yelp.com/developers/documentation/v2/search_api
        var parameters = ["term": term, "location": "San Francisco"]
        return self.GET("search", parameters: parameters, success: success, failure: failure)
    }
    
}


