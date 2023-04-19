//
//  LocationTableViewCell.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 29/03/23.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var areaView: UIView!
    
    @IBOutlet weak var cityButtonImageView: UIImageView!
    @IBOutlet weak var areaButtonImageView: UIImageView!
    
    @IBOutlet weak var cityButton: UIButton!
//    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var areaButton: UIButton!

    @IBOutlet weak var searchBar: UISearchBar!
    override func awakeFromNib() {
        super.awakeFromNib()

        cityView.setCorner(radious: 5)
        areaView.setCorner(radious: 5)
        
        cityView.layer.borderWidth = 2
        cityView.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
//        areaView.setBorder(width: 1, color: UIColor.white)
        
        backgroundColor = AppColor.primaryColor
        
        cityButton.setTitle("Surat", for: .normal)
        areaButton.setTitle("Ajdajan", for: .normal)
        
        searchBar.tintColor = AppColor.primaryColor
        searchBar.barTintColor = AppColor.primaryColor
        searchBar.backgroundColor = AppColor.primaryColor
        searchBar.isTranslucent = false
        
        let textFieldInsideSearchbar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchbar?.font = UIFont.systemFont(ofSize: 14)
        textFieldInsideSearchbar?.attributedPlaceholder = NSAttributedString(string:
                                                                            PlaceHolder.searchStore,
                                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        textFieldInsideSearchbar?.setCorner(radious: 8)
    }
}
