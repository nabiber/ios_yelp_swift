//
//  BusinessCell.swift
//  Yelp
//
//  Created by Nabib El-RAHMAN on 9/22/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var thumbnailView: UIImageView!
    
    @IBOutlet weak var ratingView: UIImageView!
    
    @IBOutlet weak var reviewLabel: UILabel!
    
    @IBOutlet weak var displayAddressLabel: UILabel!
    
    @IBOutlet weak var categoriesLabel: UILabel!
    
    @IBOutlet weak var priceRatingLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var distanceLabel: UILabel!
    
   
    var searchResult: SearchResult! {
        
        willSet(searchResult) {
            populateCell(searchResult)
        }
        
        
        didSet(oldValue) {
            //
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
        
    func populateCell(searchResult: SearchResult)
    {
        // Configure the view for the selected state
        var url = searchResult.imageUrl
        self.thumbnailView.setImageWithURL(searchResult.imageUrl)
        self.nameLabel.text = searchResult.name
        self.distanceLabel.text = searchResult.distance
        
        self.ratingView.setImageWithURL(searchResult.ratingURL)
        
        self.reviewLabel.text = "\(searchResult.numOfReviews) Reviews"
        
        self.displayAddressLabel.text = searchResult.displayAddress
        
        self.categoriesLabel.text = searchResult.categories
        
        self.priceRatingLabel.text = searchResult.priceRating
        
    }
    
}
