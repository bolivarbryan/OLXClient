//
//  OLXApiRequests.swift
//  OLXClient
//
//  Created by Bryan on 23/03/17.
//  Copyright © 2017 Bolivarbryan. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

struct OLXApiRequests {
    //MARK: Get Methods
    static func searchItemsWithTerm(term: String, inLocation location:String, pageSize: Int, offset: Int, completion: @escaping (_ results: [ItemViewModel]) -> Void) {
        
        
        var urlString = "http://api-v2.olx.com/items?"
        urlString.append("location=\(location)" )
        urlString.append("&searchTerm=\(term)")
        urlString.append("&pageSize=\(pageSize)")
        urlString.append("&offset=\(offset)")
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        

        Alamofire.request(urlString).responseJSON { (response) in
            if let json = response.result.value {
                
                guard let dataArray = (json as? Dictionary<String, Any>)?["data"] as? Array<Dictionary<String, Any>> else {
                    return
                }
                
                //clearing database before to cache latest search results
                Item.clear()
                
                for dataObject in dataArray {
                    Item.saveInstanceToDatabase(dataObject: dataObject)
                }
                
                let items = Item.listAllItems()
                var itemsViewModel = [ItemViewModel]()
                for item in items {
                    itemsViewModel.append(ItemViewModel(item: item))
                }
                
                completion(itemsViewModel)
            }
        }
    }
    
    static func loadCachedSearch() -> [ItemViewModel] {
        let items = Item.listAllItems()
        var itemsViewModel = [ItemViewModel]()
        for item in items {
            itemsViewModel.append(ItemViewModel(item: item))
        }
        return itemsViewModel
    }
}
