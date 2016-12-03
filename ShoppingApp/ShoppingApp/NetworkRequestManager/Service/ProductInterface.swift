//
//  ProductInterface.swift
//  ShoppingApp
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import Foundation

let ProductInterface = ProductInterfaceStruct()

struct ProductInterfaceStruct {
    
    func getProductsWithRequest(productRequest: ProductRequest, serviceResponse:@escaping (_ response: [Product]?,_ error: NSError?)-> Void) {
        APIInteractor.getProductsWithRequest(serviceResponse: { (response, error) in
            if let arrayResponse = response {
                let productList = arrayResponse.reduce([Product]()) { (accumProductList, productDictionary) in
                    var mutableProduct = accumProductList
                    mutableProduct.append(Product.getProductWithDictionary(productDictionary: productDictionary))
                    return mutableProduct
                }
                
                serviceResponse(productList, nil)
            } else {
                serviceResponse(nil, error!)
            }
        });
    }
}
