//
//  Model.swift
//  SimpleWeather
//
//  Created by traveler on 5/11/16.
//  Copyright © 2016 Svidal. All rights reserved.
//

import UIKit

class Model: NSObject {
    func saveJson(respond: NSDictionary) {
        
        
        let str = respond.description
        let data = str.dataUsingEncoding(NSUTF8StringEncoding)!
        let documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] 
        let writePath = documents.stringByAppendingString("file.plist")
        if let file = NSFileHandle(forWritingAtPath:writePath) {
        let saved = file.writeData(data)
//            if saved {
//            print ("saved")
//            }else{
//            print ("not saved")
//            }
            
            
        }
        
    
        
    print ("json received")
    }
    

}
