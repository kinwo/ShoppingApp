//
//  ProductInterface.swift
//  ShoppingApp
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import Foundation

class ProductInterface: NSObject {
    
    override init() {
    }
    
    func getProductsWithRequest(productRequest: ProductRequest, serviceResponse:@escaping (_ response: NSArray?,_ error: NSError?)-> Void) {
        APIInteractor.getProductsWithRequest(serviceResponse: { (response, error) in
            if error == nil {
                let productList: NSMutableArray = NSMutableArray();
                if (response?.count)! > 0 {
                    let arrayResponse = response! as NSArray
                    for i in 0  ..< arrayResponse.count  {
                        let productDictionary:NSDictionary = arrayResponse.object(at: i) as! NSDictionary
                        productList.add(Product.getProductWithDictionary(productDictionary: productDictionary))
                    }
                }
                serviceResponse(productList as NSMutableArray?, nil)
            }else {
                return serviceResponse(nil, error as NSError?)
            }
        });
    }
}
