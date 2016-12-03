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

private let isRealAPI: Bool = false // This variable used for switching API's Live or Test

let APIInteractor = APIInteractorStruct()

struct APIInteractorStruct {
    
    func getProductsWithRequest(serviceResponse:@escaping (_ response: [[String: Any]]?,_ error: NSError?)-> Void) {
        if !isRealAPI{
//            TODO: Use TestAPI
            let bundle = Bundle.main
            let path = bundle.path(forResource: kProductList, ofType: "json")
            let data:NSData = try! NSData(contentsOfFile: path!)
            
            if let json = try! JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? [String: Any], let products = json[kProducts] as? [[String: Any]] {
                serviceResponse(products, nil)
            } else {
                // TODO - Henry: Proper NSError domain and error code
                return serviceResponse (nil, NSError())
            }
        } else{
//            TODO: Use RealAPI
        }
    }
}
