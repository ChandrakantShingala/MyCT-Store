//
//  VendorCollectionViewCell.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 29/03/23.
//

import UIKit

class VendorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var minOrderLaber: UILabel!
    @IBOutlet weak var deliveryFeesLabel: UILabel!
    
    @IBOutlet weak var isOpenLabel: UIView!
    @IBOutlet weak var storeImageView: UIImageView!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var storeRatingCosmosView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
    }
    
}
