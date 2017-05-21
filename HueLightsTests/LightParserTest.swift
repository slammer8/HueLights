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

    let lights = LightParser.parse(jsonString: lightsJSON)

    XCTAssertEqual(lights.count, 3, "There should be 3 lights")

    let firstLight = lights.filter { $0.lightName == "1"}.first
    let lastLight = lights.filter { $0.lightName == "3"}.first

    if let firstLight = firstLight{
      testFirstLight(light: firstLight)
    } else {
      XCTFail("Unable to load first light")
    }

    if let lastLight = lastLight {
      testLastLight(light: lastLight)
    } else {
      XCTFail("Unable to load first light")
    }

  }

  func testFirstLight(light: Light) {
    XCTAssertEqual(light.isOn, true, "Light should be on")
    XCTAssertEqual(light.brightness, 146, "Brightness not correct")
    XCTAssertEqual(light.hue, 13234, "Hue not correct")
    XCTAssertEqual(light.saturation, 208, "Saturation not correct")
  }

  func testLastLight(light: Light) {
    XCTAssertEqual(light.isOn, false, "Light should be off")
    XCTAssertEqual(light.brightness, 100, "Brightness not correct")
    XCTAssertEqual(light.hue, 13122, "Hue not correct")
    XCTAssertEqual(light.saturation, 211, "Saturation not correct")
  }
}
