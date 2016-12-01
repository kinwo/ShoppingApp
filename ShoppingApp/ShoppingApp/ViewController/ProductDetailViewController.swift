//
//  ProductDetailViewController.swift
//  ShoppingCartTest
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var buttonBuyNow: UIButton!
    
    @IBOutlet weak var viewPager: ViewPager!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //viewPager.dataSource = self;
        viewPager.dataSource = self;
        // Do any additional setup after loading the view, typically from a nib.
       // viewPager.animationNext()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewPager.scrollToPage(0)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   //MARK: ButtonActionMethod
    
    @IBAction func buyButtonTapped(_ sender: AnyObject) {
    
    }
}

//MARK: Extention Method of ViewPager

extension ProductDetailViewController:ViewPagerDataSource{
    func numberOfItems(_ viewPager:ViewPager) -> Int {
        return 5;
    }
    
    func viewAtIndex(_ viewPager:ViewPager, index:Int, view:UIView?) -> UIView {
        var newView = view;
        var imageView : UIImageView
        var label:UILabel?
        if(newView == nil){
            newView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height:  self.view.frame.height))
            newView!.backgroundColor = UIColor.white
            
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: viewPager.frame.width, height:  viewPager.frame.height - 20))
            
            imageView.image = UIImage(named:"product1.jpg")
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
