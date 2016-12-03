//
//  RequestManager.swift
//  ShoppingApp
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import Foundation

let RequestManager = RequestManagerStruct()

struct RequestManagerStruct {
    
    func getProducts( serviceResponse:@escaping (_ response: [Product]?, _ error: NSError?)-> Void) {
        ProductInterface.getProductsWithRequest(productRequest: ProductRequest()) { (response, error) in
            //TODO: Network check
            if error == nil {
                serviceResponse(response, error)
            } else {
                //Do some additional work
                serviceResponse(nil, error)
            }
        }
    }
}
