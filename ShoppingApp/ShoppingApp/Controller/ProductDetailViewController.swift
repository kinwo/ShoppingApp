//
//  ProductDetailViewController.swift
//  ShoppingApp
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import UIKit

protocol ProductDetailDelegate  {
    func productDidPurchased()
}

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var buttonBuyNow: UIButton!
    @IBOutlet weak var viewPager: ViewPager!
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelPaid: UILabel!
    
    var delegate : ProductDetailDelegate?
    var selctedProductIndex = 0
    var product = Product()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPager.dataSource = self
        
        labelProductName.text = product.productName
        labelPrice.text = String(format: "$ \(product.amount)")
        buttonBuyNow.isUserInteractionEnabled = !product.isPaid
        labelPaid.isHidden = !product.isPaid
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewPager.scrollToPage(0)
    }
    
    //MARK: ButtonActionMethod
    @IBAction func buyButtonTapped(_ sender: AnyObject) {
        self.buttonBuyNow.isUserInteractionEnabled = false
        self.product.isPaid = true
        self.labelPaid.isHidden = false
        delegate?.productDidPurchased()
    }
}

//MARK: Extention Method of ViewPager
extension ProductDetailViewController:ViewPagerDataSource{
    func numberOfItems(_ viewPager:ViewPager) -> Int {
        return product.imageName.count
    }
    
    func viewAtIndex(_ viewPager:ViewPager, index:Int, view:UIView?) -> UIView {
        var imageView : UIImageView
        let finalView: UIView
        
        if let view = view, let label = view.viewWithTag(1) as? UILabel {
            label.text = "Page View Pager  \(index+1)"
            finalView = view
        } else {
            let newView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height:  self.view.frame.height))
            newView.backgroundColor = .white
            
            if let productImageURL = URL.init(string: product.imageName[index]) {
                imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: viewPager.frame.width, height:  viewPager.frame.height - 20))
                imageView.sd_setImage(with: productImageURL)
                imageView.contentMode = .scaleAspectFit
                newView.addSubview(imageView)
            }
            finalView = newView
        }
        
        return finalView
    }
    
    func didSelectedItem(_ index: Int) {
        print("select index \(index)")
    }
    
}
