//
//  _03CodeTestTests.swift
//  303CodeTestTests
//
//  Created by ryan kowalski on 4/25/19.
//  Copyright © 2019 ryan kowalski. All rights reserved.
//

import XCTest
@testable import _03CodeTest

class _03CodeTestTests: XCTestCase {
    
    let peopleVc = PeopleViewController()
    let dict = ["fname": "Vaibhavi",
                "lname": "Lawson",
                "city": "Hopatcong"]

    func testParsing() {
        let person = PersonObject(dictionary: dict as NSDictionary)
        XCTAssertEqual(person.cityString, "Hopatcong")
        XCTAssertEqual(person.firstNameString, "Vaibhavi")
        XCTAssertEqual(person.lastNameString, "Lawson")
    }
    
    func testJsonProcessing() {
        peopleVc.processJson()
        let person = Constants.personArray[0]
        XCTAssertEqual(person.firstNameString, "Maly")
        XCTAssertEqual(person.lastNameString, "Elmuccio")
        XCTAssertEqual(person.cityString, "Pawtucket")
    }

}
