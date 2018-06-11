//
//  Pair.swift
//  TableMS
//
//  Created by Евгений Ротарь on 11.06.2018.
//  Copyright © 2018 Евгений Ротарь. All rights reserved.
//

import UIKit

class Pair: NSObject {
    var namePair: String = ""
    var numOfLab: Int = 0
    var nameOfLab: [String] = []
    override init(){ }
    init(namePair: String, numOfLab: Int){
        self.namePair = namePair
        self.numOfLab = numOfLab
        for item in 0..<(self.numOfLab) {
            nameOfLab.append("Лаба \(item+1)")
        }
    }
    func getName() -> String{
        return namePair
    }
    func getNumOfLab() -> Int{
        return numOfLab
    }
    func getNameOfLab() -> [String]{
        return nameOfLab
    }
}
