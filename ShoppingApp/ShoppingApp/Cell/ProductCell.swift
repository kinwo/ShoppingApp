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
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
        // Configure the view for the selected state
    }
    func assignProduct(product: Product) {
        let productImageURL = NSURL.init(string: product.imageName.object(at: 0) as! String)
       self.imageViewProduct.sd_setImage(with:productImageURL as! URL, placeholderImage: UIImage(named: "product1"))
        
        //cell.imageViewProduct.image = UIImage.init(named: "");
        self.labelProductTitle.text = product.productName;
        //                cell.labelProductPrice.text = String(format: "%.2f", (ViewController.productList.object(at: indexPath.row) as AnyObject).amount)
        //        if (ViewController.productList.object(at: indexPath.row
        //            ) as AnyObject).isPaid {
        //            cell.labelPurchased.isHidden = false
        //        } else {
        //            cell.labelPurchased.isHidden = true
        //        }
        self.labelPurchased.isHidden = true
    }
 
}
