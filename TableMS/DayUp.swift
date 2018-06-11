//
//  Day.swift
//  TableMS
//
//  Created by Евгений Ротарь on 11.06.2018.
//  Copyright © 2018 Евгений Ротарь. All rights reserved.
//

import UIKit

class DayUp: NSObject {
    var dayName: String = ""
    var pair: [Pair] = []
    var numOfPair: Int = 0
    override init(){}
    init(dayName: String, pair: [Pair]){
        self.dayName = dayName
        switch self.dayName {
        case "MondayU":
            self.pair.append(pair[0])
            self.pair.append(pair[1])
            self.pair.append(pair[2])
            self.pair.append(pair[3])
        case "TuesdayU":
            self.pair.append(pair[0])
            self.pair.append(pair[1])
            self.pair.append(pair[2])
            self.pair.append(pair[3])
        case "WednesdayU":
            self.pair.append(pair[0])
            self.pair.append(pair[1])
            self.pair.append(pair[2])
            self.pair.append(pair[3])
        case "ThursdayU":
            self.pair.append(pair[0])
            self.pair.append(pair[1])
            self.pair.append(pair[2])
            self.pair.append(pair[3])
        case "FridayU":
            self.pair.append(pair[0])
            self.pair.append(pair[1])
            self.pair.append(pair[2])
            self.pair.append(pair[3])
        case "SaturdayU":
            self.pair.append(pair[0])
            self.pair.append(pair[1])
            self.pair.append(pair[2])
            self.pair.append(pair[3])
        case "SundayU":
            self.pair.append(pair[0])
            self.pair.append(pair[1])
            self.pair.append(pair[2])
            self.pair.append(pair[3])
        case "MondayD":
            self.pair.append(pair[0])
            self.pair.append(pair[1])
            self.pair.append(pair[2])
            self.pair.append(pair[3])
        case "TuesdayD":
            self.pair.append(pair[0])
            self.pair.append(pair[1])
            self.pair.append(pair[2])
            self.pair.append(pair[3])
        case "WednesdayD":
            self.pair.append(pair[0])
            self.pair.append(pair[1])
            self.pair.append(pair[2])
            self.pair.append(pair[3])
        case "ThursdayD":
            self.pair.append(pair[0])
            self.pair.append(pair[1])
            self.pair.append(pair[2])
            self.pair.append(pair[3])
        case "FridayD":
            self.pair.append(pair[0])
            self.pair.append(pair[1])
            self.pair.append(pair[2])
            self.pair.append(pair[3])
        case "SaturdayD":
            self.pair.append(pair[0])
            self.pair.append(pair[1])
            self.pair.append(pair[2])
            self.pair.append(pair[3])
        case "SundayD":
            self.pair.append(pair[0])
            self.pair.append(pair[1])
            self.pair.append(pair[2])
            self.pair.append(pair[3])
        default:
            print("err")
        }
        
    }
    func getAllPair() -> [Pair]{
        return pair
    }
    
}
