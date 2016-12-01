//
//  ProductsViewController.swift
//  ShoppingApp
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import UIKit


class ProductsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    static var productList: NSArray = NSArray()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getProducts()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  ProductsViewController.productList.count > 0 {
            return ProductsViewController.productList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductCell
        let product: Product = ProductsViewController.productList.object(at: indexPath.row) as! Product
        cell.assignProduct(product: product)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    // MARK: - Private methods
    
    func getProducts() {
        RequestManager.getProducts { (response, error) in
            if error == nil {
                ProductsViewController.productList = response!
                self.tableView.reloadData()
            }
        }
    }
    
}

