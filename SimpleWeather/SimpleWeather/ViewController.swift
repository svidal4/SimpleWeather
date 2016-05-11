//
//  ViewController.swift
//  SimpleWeather
//
//  Created by traveler on 5/4/16.
//  Copyright © 2016 Svidal. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet var labelTemp: UILabel?
    
    enum JSONError: String, ErrorType {
        case NoData = "ERROR: no data"
        case ConversionFailed = "ERROR: conversion from JSON failed"
    }
    
    func jsonParser() {
        let APIKEY = "81d462d12f0bad3f8600b88769a5576e"
   
        var urlPath: String = "http://api.openweathermap.org/data/2.5/forecast/city?q=London&units=metric&APPID=81d462d12f0bad3f8600b88769a5576e&units=metric"
        //api.openweathermap.org/data/2.5/find?q=London&units=metric
        
        urlPath += APIKEY
        print(urlPath)
        
        guard let endpoint = NSURL(string: urlPath) else {
            print("Error creating endpoint")
            return
        }
        let request = NSMutableURLRequest(URL:endpoint)
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) in
            do {
                guard let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary else {
                    throw JSONError.ConversionFailed
                }
//                let result2 = (json["temp"] as! String)
//                self.labelTemp?.text = result2
                
                //let a=1
                
                 let list = json.objectForKey("list") as? [[String:AnyObject]]
                    let element = list![0] as! Dictionary
                        let weather = element["main"]
                        let temp = weather!["temp"] as! Int
                        self.labelTemp?.text = String(temp)
             
                                print("************************")
                                print("finished downloading data " + String(json))
                
                
                            } catch let error as NSError {
                                print("Failed to load: \(error.localizedDescription)")
                            }
                
                
                            } .resume()

                
        
    }
    
 
    
    
    override func viewDidLoad() {
    
         jsonParser()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
      
        super.viewDidAppear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
}



//                guard let data = data else {
//                    throw JSONError.NoData
//                }
//                guard let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary else {
//                    throw JSONError.ConversionFailed
//                }
//                print(json)
//            } catch let error as JSONError {
//                print(error.rawValue)
//            } catch let error as NSError {
//                print(error.debugDescription)
//            }
//            }.resume()
//



//let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary


//                                let responseData = json["responseData"]!
//
//                                let results = responseData["results"]!   // this returns an array
//
//                                for result in (json as! Array<Dictionary<String, AnyObject>>) {
//
//                                    var tempDelegate: String {
//
//                                        let result2 = (json["temp"] as! String)
//                                        self.labelTemp?.text = result2
//
//                                        return result2
//                                    }

//                             }






//        let session = NSURLSession.sharedSession()
//        let urlString = "http://api.openweathermap.org/data/2.5/forecast/city?q=brooklyn&APPID=81d462d12f0bad3f8600b88769a5576e&units=metric"
//        let url = NSURL(string: urlString)
//        let request = NSURLRequest(URL: url!)
//
//
//
//        //let _ = session.dataTaskWithRequest(request) { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
//
//          //  let dataAsString = NSString(data:data!, encoding:NSUTF8StringEncoding)
//          //  print(dataAsString)
//
//
//            //	str.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
//            session.dataTaskWithRequest(request) { (data, response, error) in
//            do {

//
//
//                guard let data = data else {
//                    throw JSONError.NoData
//                }
//                guard let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary else {
//                    throw JSONError.ConversionFailed
//                }
//                print(json)
//            } catch let error as JSONError {
//                print(error.rawValue)
//            } catch let error as NSError {
//                print(error.debugDescription)
//            }
//            }.resume()
//






//            do {
//                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! [String: AnyObject]
//
//
//                let responseData = json["responseData"]!
//
//                let results = responseData["results"]!   // this returns an array
//
//                for result in (results as! Array<Dictionary<String, AnyObject>>) {
//
//                    var tempDelegate: String {
//
//                        let result2 = (result["temp"] as! String)
//                        self.labelTemp?.text = result2
//
//                        return result2
//                    }
//
//             }
//

//                print("************************")
//                print("finished downloading data " + String(json))
//
//
//            } catch let error as NSError {
//                print("Failed to load: \(error.localizedDescription)")
//            }
//
//
//            } .resume()



