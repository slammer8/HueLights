//
//  LightParser.swift
//  HueLights
//
//  Created by Wu, Samuel on 5/21/17.
//  Copyright © 2017 BothPoints. All rights reserved.
//

final class LightParser {

  static func parse(jsonString: [String: Any]?) -> [Light] {

    guard let lightsJSON = jsonString?["lights"] as? [String: Any] else {
      assertionFailure("lights key was not found in JSON")
      return []
    }

    let lights: [Light] = lightsJSON.flatMap {

      guard let lightInfo = $0.value as? [String: Any],
        let state = lightInfo["state"] as? [String: Any],
        let isOn = state["on"] as? Bool,
        let brightness = state["bri"] as? Int,
        let hue = state["hue"] as? Int,
        let saturation = state["sat"] as? Int else { return nil }

      return Light(lightName: $0.key, isOn: isOn, saturation: saturation, brightness: brightness, hue: hue)
    }

    return lights
  }
}
