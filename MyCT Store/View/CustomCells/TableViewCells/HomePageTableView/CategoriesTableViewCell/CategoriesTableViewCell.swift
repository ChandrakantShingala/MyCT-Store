//
//  CategoriesTableViewCell.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 29/03/23.
//

import UIKit

protocol CategoryCollectionViewCellDelegate: AnyObject {
    func didSelect(at index: Int)
}

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var viewMoreButton: UIButton!        
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var delegate: CategoryCollectionViewCellDelegate?
    var selectedCategoryIndex: Int = 0
    var arrCategorise: [StoreTypeViewModel] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
    
    func set(arrCategorise: [StoreTypeViewModel], selectedCategoryIndex: Int){
        self.arrCategorise = arrCategorise
        self.selectedCategoryIndex = selectedCategoryIndex
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.reloadData()
    }
    @IBAction func viewMoreButtonTapped(_ sender: UIButton) {
    }
}

extension CategoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCategorise.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        let category: StoreTypeViewModel = arrCategorise[indexPath.row]
        if selectedCategoryIndex == indexPath.row{
            cell.backgroundColor = AppColor.primaryColor
            cell.nameLabel.textColor = .white
            cell.nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        } else {
            cell.backgroundColor = AppColor.primaryColor
            cell.nameLabel.textColor = .white
            cell.nameLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(at: indexPath.row)
    }
}

extension CategoriesTableViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 95, height: 38)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
