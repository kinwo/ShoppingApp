//
//  ProductRequest.swift
//  ShoppingApp
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import Foundation

class ProductRequest: NSObject {
    
    var fileUrl : String = "";
    var params : NSDictionary = NSDictionary()
    
    override init() {
        self.fileUrl = "Some url...."
//        params = @{} //Some params
    }
}
