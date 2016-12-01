//
//  APIInteractor.swift
//  ShoppingCart
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import Foundation

typealias serviceResponse = (NSArray?, NSError?) -> Void

let isRealAPI: Bool = false // This variable used for switching API's Live or Test


class APIInteractor: NSObject {
    
    class func getProductsWithRequest(serviceResponse:@escaping (_ response: NSArray?,_ error: NSError?)-> Void) {
        if !isRealAPI{
            let bundle = Bundle.main
            let path = bundle.path(forResource: "ProductList", ofType: "json")
            let _:NSError?
            let data:NSData = try! NSData(contentsOfFile: path!)
            let json = try! JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary
            let products:NSArray = json?.value(forKey: "Products") as! NSArray
            if products.count > 0{
                return serviceResponse(products, nil)
            }else {
                let error : NSError = NSError()
                return serviceResponse (nil,error as NSError?)
            }
        }
        else{
            // Call to real API
        }
    }
}
