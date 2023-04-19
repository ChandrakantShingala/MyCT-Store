//
//  CategoryCollectionViewCell.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 29/03/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setCorner(radious: 4)
    }

}
