//
//  ProductsViewController.swift
//  ShoppingApp
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import UIKit
import SDWebImage

class ProductsViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let listModal: ProductListModal = ProductListModal.init()
//        let productList : NSArray = listModal.readJsonFile(fileName: "ProductList")
//        if productList.count > 0 {
//            for i in 0  ..< productList.count  {
//                let product: Product = productList.object(at: i) as! Product
//                print("\(product.productName)   \(product.imageName)   \(product.amount)   \(product.isPaid)")
//            }
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductCell
        //let backgroundPhotoUrl = NSURL.init(string: "http://www.domain.com/path/to/image.jpg")
        //cell.imageViewProduct.sd_setImage(with:backgroundPhotoUrl as! URL, placeholderImage: UIImage(named: "product1"))
        //        cell.setValues(inviteType: inviteType, indexPath: indexPath)
        //        cell.imageViewProduct.image = UIImage.init(named: "");
        //        cell.labelProductTitle.text = "";
        //        cell.labelProductPrice.text = "";
        //        cell.labelPurchased.isHidden = true;
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}

