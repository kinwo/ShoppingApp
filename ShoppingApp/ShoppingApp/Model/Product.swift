//
//  Product.swift
//  ShoppingApp
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import Foundation

private let kProductName = "productName"
private let kAmount = "amount"
private let kImageName = "imageName"
private let kIspaid = "ispaid"

class Product {
    var productName = ""
    var imageName = [String]()
    var amount = 0.0
    var isPaid = false
    
    init() {
        
    }
    
    init(withProductDetails productName: String, imageName: [String], amount: Double, isPaid: Bool) {
        self.productName = productName
        self.imageName = imageName
        self.amount = amount
        self.isPaid = isPaid
    }
    
    class func getProductWithDictionary(productDictionary: [String: Any]) -> Product {
        let productObject :Product = Product.init(withProductDetails: productDictionary[kProductName] as! String, imageName: productDictionary[kImageName] as! [String], amount: productDictionary[kAmount] as! Double, isPaid: productDictionary[kIspaid] as! Bool)
        return productObject
    }
}
