//
//  MyOrderViewController.swift
//  MyCT Store
//
//  Created by Chandrakant Shingala on 11/04/23.
//

import UIKit

class MyOrderViewController: UIViewController {

    @IBOutlet weak var myOrderTableView: UITableView!
    
    let viewModel: MyOrderViewModel = MyOrderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func fecthDetails(){
        viewModel.fecthDetails { result in
            switch result{
            case .success:
                self.myOrderTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension MyOrderViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
