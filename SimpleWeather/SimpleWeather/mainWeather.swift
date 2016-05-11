//
//  mainWeather.swift
//  SimpleWeather
//
//  Created by Sebastian Vidal on 5/7/16.
//  Copyright © 2016 Svidal. All rights reserved.
//

import UIKit

class mainWeather: NSObject {
    var temp = "0"
    var tempMin = 0
    var tempMax = 0
    var presure = 0
    var humidity = 0
    var mainWeatherId = 0
    var mainWeatherDescription = ""
    var mainWeatherIcon = ""
    var cloudAll = 0
    var windSpeed = 0
    var windDeg = 0
    
    

}

/*

  "main":{
                "temp":278.24,
                "temp_min":278.24,
                "temp_max":278.244,
                "pressure":1027.46,
                "sea_level":1037.72,
                "grnd_level":1027.46,
                "humidity":54,
                "temp_kf":0
             },
         "weather":[
            {
               "id":800,
               "main":"Clear",
               "description":"clear sky",
               "icon":"01n"
            }
 
 "clouds":{
             "all":0
          },
          "wind":{
             "speed":1.86,
             "deg":132.501
 
*/