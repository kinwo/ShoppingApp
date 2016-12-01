//
//  RequestManager.swift
//  ShoppingApp
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import Foundation

class RequestManager: NSObject {
    
    class func getProducts( serviceResponse:@escaping (_ response: NSArray?,_ error: NSError?)-> Void) {
        ProductInterface().getProductsWithRequest(productRequest: ProductRequest()) { (response, error) in
            //TODO: Network check
            if error == nil {
                serviceResponse(response, error)
            }else {
                //Do some additional work
                serviceResponse(nil, error)
            }
        }
    }
}
