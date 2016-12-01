//
//  Product.swift
//  Shopping Cart
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import Foundation


class Product: NSObject {
    var productName : String = ""
    var imageName : NSArray = NSArray()
    var amount : Float = 0.0
    var isPaid : Bool = false
    
    init(withProductDetails productName: String, imageName: NSArray, amount: Float, isPaid: Bool) {
        self.productName = productName
        self.imageName = imageName
        self.amount = amount
        self.isPaid = isPaid
    }
    class func getProductWithDictionary(productDictionary: NSDictionary) -> Product {
        let productObject :Product = Product.init(withProductDetails: productDictionary["productName"] as! String, imageName: productDictionary["imageName"] as! NSArray, amount: productDictionary["amount"] as! Float, isPaid: productDictionary["ispaid"] as! Bool)
        return productObject
    }
}
