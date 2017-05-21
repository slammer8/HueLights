//
//  LightParserTest.swift
//  HueLightsTests
//
//  Created by Wu, Samuel on 5/21/17.
//  Copyright © 2017 BothPoints. All rights reserved.
//

import XCTest
@testable import HueLights

class LightParserTest: XCTestCase {

    func testParser() {
      let lightsJSON = JSONLoader.load(file: "SampleResponse")

      XCTAssertNotNil(lightsJSON, "JSON should not be nil")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
