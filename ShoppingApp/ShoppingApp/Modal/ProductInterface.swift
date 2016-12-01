//
//  ProductInterface.swift
//  ShoppingCart
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import Foundation

class ProductInterface: NSObject {
    
    var productList: NSMutableArray = NSMutableArray();
    
    override init() {
    }
    
    func getProductsWithRequest(productRequest: ProductRequest, serviceResponse:@escaping (_ response: NSArray?,_ error: NSError?)-> Void) {
          APIInteractor.getProductsWithRequest(serviceResponse: { (response, error) in
                if error == nil {
                    if (response?.count)! > 0 {
                        let arrayResponse = response! as NSArray
                        for i in 0  ..< arrayResponse.count  {
                            let productDictionary:NSDictionary = arrayResponse.object(at: i) as! NSDictionary
                            self.productList.add(Product.getProductWithDictionary(productDictionary: productDictionary))
                        }
                    }
                    serviceResponse(self.productList as NSMutableArray?, nil)
                }else {
                    return serviceResponse(nil, error as NSError?)
                }
            });
    }
}
