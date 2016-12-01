//
//  ProductRequest.swift
//  ShoppingCart
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import Foundation

class ProductRequest: NSObject {
    
    var fileUrl: String = "";
    
    override init() {
            self.fileUrl = "ProductList"
    }
}
