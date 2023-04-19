//
//  VendorTableViewCell.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 29/03/23.
//

import UIKit

class VendorTableViewCell: UITableViewCell {

    @IBOutlet weak var vendorsCollectionView: UICollectionView!
    var arrVendor: [VendorViewModel] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        vendorsCollectionView.register(UINib(nibName: "VendorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VendorCollectionViewCell")
    }
    
    func set(arrVendors: [VendorViewModel]) {
        self.arrVendor = arrVendors
        vendorsCollectionView.delegate = self
        vendorsCollectionView.dataSource = self
        vendorsCollectionView.reloadData()
    }
}

extension VendorTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrVendor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: VendorCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: VendorCollectionViewCell.identifier, for: indexPath) as! VendorCollectionViewCell
        let vendor: VendorViewModel = arrVendor[indexPath.row]
        cell.storeNameLabel.text = vendor.getName()
        cell.storeImageView.sd_setImage(with: URL(string: vendor.getImageName()), placeholderImage: UIImage(systemName: "person.fill"))
        print(vendor.getImageName())
        return cell
    }
}
extension VendorTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width-20, height: 169)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}
