//
//  Product.swift
//  ShoppingApp
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import Foundation

let kProductName = "productName"
let kAmount = "amount"
let kImageName = "imageName"
let kIspaid = "ispaid"



class Product: NSObject {
    var productName : String = ""
    var imageName : NSArray = NSArray()
    var amount : Float = 0.0
    var isPaid : Bool = false
    
    override init() {
        
    }
    
    init(withProductDetails productName: String, imageName: NSArray, amount: Float, isPaid: Bool) {
        self.productName = productName
        self.imageName = imageName
        self.amount = amount
        self.isPaid = isPaid
    }
    
    class func getProductWithDictionary(productDictionary: NSDictionary) -> Product {
        let productObject :Product = Product.init(withProductDetails: productDictionary[kProductName] as! String, imageName: productDictionary[kImageName] as! NSArray, amount: productDictionary[kAmount] as! Float, isPaid: productDictionary[kIspaid] as! Bool)
        return productObject
    }
}
