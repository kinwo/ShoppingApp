//
//  APIInteractor.swift
//  ShoppingApp
//
//  Created by Sumit on 01/12/16.
//  Copyright © 2016 Sumit. All rights reserved.
//

import Foundation
let kProductList = "ProductList"
let kProducts  = "Products"

typealias serviceResponse = (NSArray?, NSError?) -> Void

let isRealAPI: Bool = false // This variable used for switching API's Live or Test


class APIInteractor: NSObject {
    
    class func getProductsWithRequest(serviceResponse:@escaping (_ response: NSArray?,_ error: NSError?)-> Void) {
        if !isRealAPI{
//            TODO: Use TestAPI
            let bundle = Bundle.main
            let path = bundle.path(forResource: kProductList, ofType: "json")
            let _:NSError?
            let data:NSData = try! NSData(contentsOfFile: path!)
            let json = try! JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary
            let products:NSArray = json?.value(forKey: kProducts) as! NSArray
            if products.count > 0{
                return serviceResponse(products, nil)
            }else {
                let error : NSError = NSError()
                return serviceResponse (nil,error as NSError?)
            }
        }
        else{
//            TODO: Use RealAPI
        }
    }
}
