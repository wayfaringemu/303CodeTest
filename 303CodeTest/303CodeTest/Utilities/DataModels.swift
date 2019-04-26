//
//  DataModels.swift
//  303CodeTest
//
//  Created by ryan kowalski on 4/25/19.
//  Copyright © 2019 ryan kowalski. All rights reserved.
//

import Foundation


class PersonObject: NSObject {
    var firstNameString, lasntNameString, cityString : String?
    
    init(dictionary: NSDictionary) {
        firstNameString = dictionary["fname"] as? String
        lasntNameString = dictionary["lname"] as? String
        cityString = dictionary["city"] as? String
    }
}

struct Constants {
    static var personArray = [PersonObject]()
    
}
