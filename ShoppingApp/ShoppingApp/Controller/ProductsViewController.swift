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


class ProductsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource , ProductDetailDelegate {
    
    @IBOutlet var tableView: UITableView!
    var productList: NSMutableArray = NSMutableArray()
    var isProductPurchased = false
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getProducts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isProductPurchased {
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - TableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  self.productList.count > 0 {
            return self.productList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: KProductCell) as! ProductCell
        let product: Product = self.productList.object(at: indexPath.row) as! Product
        cell.assignProduct(product: product)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: KProductDetailViewController) as! ProductDetailViewController
        viewController.delegate = self
        viewController.product = self.productList.object(at: indexPath.row) as! Product
        isProductPurchased = false
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Private methods
    
    func getProducts() {
        RequestManager.getProducts { (response, error) in
            if error == nil {
                self.productList = response! as! NSMutableArray
                self.tableView.reloadData()
            }
        }
    }
    
     // MARK: - ProductDetailDelegate
    
    func productDidPurchased() {
        isProductPurchased = true
    }
}

