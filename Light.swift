//
//  Light.swift
//  HueLights
//
//  Created by Wu, Samuel on 4/22/17.
//  Copyright © 2017 BothPoints. All rights reserved.
//

final class Light {
    let lightName: String
    let isOn: Bool
    let saturation: Int
    let brightness: Int
    let hue: Int

    init(lightName: String, isOn: Bool, saturation: Int, brightness: Int, hue: Int) {
        self.lightName = lightName
        self.isOn = isOn
        self.saturation = saturation
        self.brightness = brightness
        self.hue = hue
    }
}
