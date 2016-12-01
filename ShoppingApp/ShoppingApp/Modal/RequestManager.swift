//
//  RequestManager.swift
//  Sumit
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import Foundation

class RequestManager: NSObject {
    
    class func getProducts( serviceResponse:@escaping (_ response: NSArray?,_ error: NSError?)-> Void) {
        ProductInterface().getProductsWithRequest(productRequest: ProductRequest()) { (response, error) in
            if error == nil {
                serviceResponse(response, nil)
            }else {
                serviceResponse(nil, error)
            }
        }
    }
}
