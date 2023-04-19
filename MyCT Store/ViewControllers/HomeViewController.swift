//
//  HomeViewController.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 31/03/23.
//

import UIKit

class HomeViewController: UIViewController, CategoryCollectionViewCellDelegate, BannerTableViewCellDelegate, DeliveryOptionTableViewCellDelegate {

    // MARK: - @IBOutlet
    @IBOutlet weak var homePageTableView: UITableView!
    
    // MARK: - Variables
    var viewModel: HomeViewModel = HomeViewModel()
//    var arrTableViewCells: [String] = ["LocationTableViewCell","CategoriesTableViewCell","BannerTableViewCell","deliveryOptionSegment"]
    var arrTableViewCells = [LocationTableViewCell.identifier, CategoriesTableViewCell.identifier, BannerTableViewCell.identifier, DeliveryOptionTableViewCell.identifier,VendorTableViewCell.identifier]
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        fecthDetail()
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Initialization
    private func setUp(){
        arrTableViewCells.forEach { cellName in
            homePageTableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        }
        homePageTableView.separatorStyle = .none
        
        if #available(iOS 15.0, *) {homePageTableView.sectionHeaderTopPadding = 0.0}
    }

    // MARK: - Get Home Page Details
    
    private func fecthDetail(){
        guard Config.isInternetAvailabel() else {
            print("Error Internet is not avi")
            return
        }
        viewModel.fecthDetails { result in
            switch result{
            case .success:
                self.homePageTableView.reloadData()
            case .failure(let error):
                print("Home View Controllrt\(error.localizedDescription)")
            }
        }
    }
    
    func didSelect(at index: Int) {
        viewModel.update(selectedCategoryIndex: index)
        homePageTableView.reloadData()
        fecthDetail()
    }
    
    func didSelectBanner(at index: Int) {
        print(index)
    }
    
    func deliveryOptionSegmentTapped(selectedIndex: Int) {
        viewModel.update(selectedDeliveryIndex: selectedIndex)
        homePageTableView.reloadData()
        fecthDetail()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell: LocationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell") as! LocationTableViewCell
            return cell
        case 1:
            let cell: CategoriesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell") as! CategoriesTableViewCell
            cell.delegate = self
            cell.set(arrCategorise: viewModel.arrCategories, selectedCategoryIndex: viewModel.selectedCategoryIndex)
            return cell
        case 2:
            let cell: BannerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell") as! BannerTableViewCell
            cell.delegate = self
            cell.set(arrBanner: viewModel.arrBanner)
            return cell
        case 3:
            let cell: DeliveryOptionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DeliveryOptionTableViewCell") as! DeliveryOptionTableViewCell
            cell.delegate = self
            cell.set(selectedIndex: viewModel.selectedDeliveryIndex)
            return cell
        case 4:
            let cell: VendorTableViewCell = tableView.dequeueReusableCell(withIdentifier: "VendorTableViewCell") as! VendorTableViewCell
            cell.set(arrVendors: viewModel.arrVendor)
            return cell
        default:  return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 106
        case 1: return 50
        case 2: return 200
        case 3: return 60
        case 4: return tableView.frame.height
        default: return 44
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height))
        return header
    }
    //extension HomeViewController: CategoryCollectionViewCellDelegate {
    //    func didSelect(at index: Int) {
    //        viewModel.update(selectedCategoryIndex: index)
    //        homePageTableView.reloadData()
    //        fecthDetail()
    //    }
    //}
    //
    //extension HomeViewController: DeliveryOptionTableViewCellDelegate {
    //    func deliveryOptionSegmentTapped(selectedIndex: Int) {
    //        viewModel.update(selectedDeliveryIndex: selectedIndex)
    //        homePageTableView.reloadData()
    //        fecthDetail()
    //    }
    //}
    //
    //extension HomeViewController: CategoryCollectionViewCellDelegate {
    //    func didSelect(at index: Int) {
    //        print(index)
    //    }
    //
}
