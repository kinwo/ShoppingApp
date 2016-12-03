//
//  ProductsViewController.swift
//  ShoppingApp
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import UIKit

let KProductCell = "ProductCell"
let KProductDetailViewController = "ProductDetailViewController"

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ProductDetailDelegate {
    
    @IBOutlet var tableView: UITableView!
    var productList = [Product]()
    var isProductPurchased = false
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getProducts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isProductPurchased {
            tableView.reloadData()
        }
    }
    // MARK: - TableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: KProductCell) as! ProductCell
        let product = productList[indexPath.row]
        cell.assignProduct(product: product)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: KProductDetailViewController) as! ProductDetailViewController
        viewController.delegate = self
        viewController.product = productList[indexPath.row]
        isProductPurchased = false
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Private methods
    
    func getProducts() {
        RequestManager.getProducts { (response, error) in
            if let error = error {
                print("Handle error: \(error)")
            } else if let response = response {
                self.productList = response
                self.tableView.reloadData()
            }
        }
    }
    
     // MARK: - ProductDetailDelegate
    
    func productDidPurchased() {
        isProductPurchased = true
    }
}

