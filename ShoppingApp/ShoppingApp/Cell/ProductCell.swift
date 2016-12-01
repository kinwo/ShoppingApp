//
//  ProductCell.swift
//  ShoppingCartTest
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    //MARK: Public Method
    
    func assignProduct(product: Product) {
        let productImageURL = NSURL.init(string: product.imageName.object(at: 0) as! String)
        self.imageViewProduct.sd_setImage(with:productImageURL as! URL, placeholderImage: UIImage(named: "product1"))
        self.labelProductTitle.text = product.productName;
        self.labelProductPrice.text = String(format: "$ \(product.amount)")
        self.labelPurchased.isHidden = true
    }
}
