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
    
    var searchResult: SearchResult!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        var url = self.searchResult.imageUrl
        self.thumbnailView.setImageWithURL(self.searchResult.imageUrl)
        self.nameLabel.text = self.searchResult.name
        self.distanceLabel.text = self.searchResult.distance
        
        self.ratingView.setImageWithURL(self.searchResult.ratingURL)
        
        self.reviewLabel.text = "\(self.searchResult.numOfReviews) Reviews"
        
        self.displayAddressLabel.text = self.searchResult.displayAddress
        
        self.categoriesLabel.text = self.searchResult.categories
        
        self.priceRatingLabel.text = self.searchResult.priceRating

    }
    
    func addSearchResult(searchResult: SearchResult) {
        self.searchResult = searchResult
    }
}
