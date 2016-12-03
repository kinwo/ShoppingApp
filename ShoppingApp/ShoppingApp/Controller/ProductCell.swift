//
//  ProductCell.swift
//  ShoppingApp
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import UIKit
import SDWebImage

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var imageViewProduct: UIImageView!
    @IBOutlet weak var labelProductTitle: UILabel!
    @IBOutlet weak var labelProductPrice: UILabel!
    @IBOutlet weak var labelPurchased: UILabel!
    
    //MARK: Public Method
    
    func assignProduct(product: Product) {
        self.labelProductTitle.text = product.productName;
        self.labelProductPrice.text = String(format: "$ \(product.amount)")
        self.labelPurchased.isHidden = !product.isPaid
        
        if let productImageURL = URL(string: product.imageName[0]) {
            self.imageViewProduct.sd_setImage(with:productImageURL, placeholderImage: UIImage(named: "product1"))
        }
    }
}
