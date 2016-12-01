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
    
    var delegate : ProductDetailDelegate?
    var selctedProductIndex : Int = 0
    var product : Product = Product()
    @IBOutlet weak var labelPaid: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPager.dataSource = self;
        
        self.labelProductName.text = self.product.productName
        self.labelPrice.text = String(format: "$ \(self.product.amount)")
        self.buttonBuyNow.isUserInteractionEnabled = self.product.isPaid ? false : true;
        self.labelPaid.isHidden = self.product.isPaid ? false : true;
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewPager.scrollToPage(0)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        return self.product.imageName.count;
    }
    
    func viewAtIndex(_ viewPager:ViewPager, index:Int, view:UIView?) -> UIView {
        var newView = view;
        var imageView : UIImageView
        var label:UILabel?
        if(newView == nil){
            newView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height:  self.view.frame.height))
            newView!.backgroundColor = UIColor.white
            
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: viewPager.frame.width, height:  viewPager.frame.height - 20))
            let productImageURL = NSURL.init(string: self.product.imageName.object(at: index) as! String)
            imageView.sd_setImage(with: productImageURL as URL!)
            newView?.addSubview(imageView)
        }else{
            label = newView?.viewWithTag(1) as? UILabel
        }
        label?.text = "Page View Pager  \(index+1)"
        
        return newView!
    }
    
    func didSelectedItem(_ index: Int) {
        print("select index \(index)")
    }
    
}
