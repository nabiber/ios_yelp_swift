//
//  PriceCell.swift
//  Yelp
//
//  Created by Nabib El-RAHMAN on 9/24/14.
//  Copyright (c) 2014 Codepath. All rights reserved.
//

import UIKit

protocol PriceCellDelegate {
    func priceValueChanged(priceCell: PriceCell, newValue: String)
}

class PriceCell: UITableViewCell {
    var delegate: PriceCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func onValueChanged(sender: UISegmentedControl) {
        let currentValue = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)
        self.delegate?.priceValueChanged(self, newValue: currentValue)
    }

}
