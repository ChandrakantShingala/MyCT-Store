//
//  DeliveryOptionTableViewCell.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 29/03/23.
//

import UIKit

protocol DeliveryOptionTableViewCellDelegate: AnyObject{
    func deliveryOptionSegmentTapped(selectedIndex: Int)
}

class DeliveryOptionTableViewCell: UITableViewCell {

    // MARK: - @IBOutlet
    @IBOutlet weak var deliveryOptionSegment: UISegmentedControl!
    
    var delegate: DeliveryOptionTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        deliveryOptionSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .medium)], for: .selected)
        deliveryOptionSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)], for: .normal)
        deliveryOptionSegment.backgroundColor = UIColor.clear
    }
    
    func set(selectedIndex: Int){
        deliveryOptionSegment.selectedSegmentIndex = selectedIndex
    }
    
    @IBAction func deliveryOptionSegmentTapped(_ sender: UISegmentedControl) {
    }
}
