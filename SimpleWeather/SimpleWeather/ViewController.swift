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
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var tempMax: UILabel!
    @IBOutlet weak var tempMin: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var rainThreeH: UILabel!
    
    @IBOutlet weak var mainDescription: UILabel!
    @IBOutlet weak var mainIcon: UIImageView!
    
    var model = Model()
    
    //var fillTemp: Int = 0
    
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

                
                let list = json.objectForKey("list") as? [[String:AnyObject]]
                let element = list![0]
                let weather = element["main"]
                let temp = weather!["temp"] as! Int
                // self.fillTemp = temp
                self.labelTemp?.text = String(temp)
               
                
           
                let city = json.objectForKey("city") as? NSDictionary?
                let nameCity = city!!.objectForKey("name") as! String?
                self.cityName.text? = (String?(nameCity!.uppercaseString))!
                
                
                let tempMinList = json.objectForKey("list") as? [[String:AnyObject]?]
                let elementTempMinList = tempMinList![0]
                let tempMinMain = elementTempMinList!["main"]
                let tempMin = tempMinMain!["temp_min"] as! Int
                self.tempMin?.text = String(tempMin)
                
                
                let tempMaxList = json.objectForKey("list") as? [[String:AnyObject]?]
                let elementTempMaxList = tempMaxList![0]
                let tempMaxMain = elementTempMaxList!["main"]
                let tempMax = tempMaxMain!["temp_max"] as! Int
                self.tempMax?.text = String(tempMax)
                
                
                let pressureList = json.objectForKey("list") as? [[String:AnyObject]?]
                let elementpressureList = pressureList![0]
                let pressureMain = elementpressureList!["main"]
                let pressure = pressureMain!["pressure"] as! Float
                self.pressure?.text = String(pressure) + "hPa"
                
                
                let humidityList = json.objectForKey("list") as? [[String:AnyObject]?]
                let elementhumidityList = humidityList![0]
                let humidityMain = elementhumidityList!["main"]
                let humidity = humidityMain!["humidity"] as! Int
                self.humidity?.text = String(humidity) + "%"

                
                let mainDescriptionList = json.objectForKey("list") as? [[String:AnyObject]?]
                let elementmainDescriptionList = mainDescriptionList![0]
                let mainDescriptionWeather = elementmainDescriptionList!["weather"]
                //let elementmainDescriptionInsideWeather = mainDescriptionWeather[0]
                let mainDescription = mainDescriptionWeather!["description"] as! String
                self.mainDescription?.text = String?(mainDescription.capitalizedString)

                if tempMax != 0 {
                    print("something is nil")
                }
                if tempMin != 0 {
                    print("something is nil")
                }
                if temp != 0 {
                    print("something is nil")
                }
                if humidity != 0 {
                    print("something is nil")
                }
                if pressure != 0 {
                    print("something is nil")
                }
                
                
                self.model.saveJson(json) //le pase el json al Model
                
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



