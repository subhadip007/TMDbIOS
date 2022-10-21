//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Zaggle on 10/10/22.
//

import Foundation

struct MovieData:Codable{
    let results:[Movie]?
}



struct Movie:Codable{
    let title:String?
    let poster_path:String?
    let release_date:String?
    let vote_average:Float?
    let overview:String?
}
