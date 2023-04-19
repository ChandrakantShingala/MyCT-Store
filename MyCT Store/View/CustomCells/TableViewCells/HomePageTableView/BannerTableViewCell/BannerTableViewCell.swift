//
//  BannerTableViewCell.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 29/03/23.
//

import UIKit
import SDWebImage

protocol BannerTableViewCellDelegate: AnyObject{
    func didSelectBanner(at index: Int)
}

class BannerTableViewCell: UITableViewCell {

    // MARK: - @IBOutlet
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    // MARK: - Variables
    var arrBanner: [BannerViewModel] = []
    var delegate: BannerTableViewCellDelegate?
    
    // MARK: - Life cycle Method
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerCollectionView.register(UINib(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannerCollectionViewCell")
    }
    
    func set(arrBanner: [BannerViewModel]){
        self.arrBanner = arrBanner
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource Method
extension BannerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrBanner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifier, for: indexPath) as! BannerCollectionViewCell
        let banner: BannerViewModel = arrBanner[indexPath.row]
        cell.imgView.sd_setImage(with: URL(string: banner.getImageName()), placeholderImage: UIImage(systemName: "person.fill"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectBanner(at: indexPath.row)
    }
}


// MARK: - UICollectionViewDelegateFlowLayout Method
extension BannerTableViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 8, right: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
