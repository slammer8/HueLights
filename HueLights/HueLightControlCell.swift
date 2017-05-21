//
//  HueLightControlCell.swift
//  HueLights
//
//  Created by Wu, Samuel on 4/22/17.
//  Copyright © 2017 BothPoints. All rights reserved.
//

import UIKit

class HueLightControlCell: UITableViewCell {

  static let Identifier = "HueLightControlCellIdentifier"

  /// The handler to call when the cell is tapped.
  var changeHandler: ((Light) -> ())?

  private var light: Light?

  @IBOutlet private weak var lightNameLabel: UILabel!
  @IBOutlet private weak var lightSwitch: UISwitch!

  @IBOutlet private weak var saturationValueLabel: UILabel!
  @IBOutlet private weak var saturationSlider: UISlider!

  @IBOutlet private weak var brightnessValueLabel: UILabel!
  @IBOutlet private weak var brightnessSlider: UISlider!

  @IBOutlet private weak var hueValueLabel: UILabel!
  @IBOutlet private weak var hueSlider: UISlider!

  override func awakeFromNib() {
    super.awakeFromNib()
  }


  /// Configure the cell with a light.
  ///
  /// - Parameter light: The light to use.
  func configure(with light: Light) {
    self.light = light
    lightNameLabel.text = light.lightName
    lightSwitch.isOn = light.isOn
    brightnessSlider.value = Float(light.brightness)
    saturationSlider.value = Float(light.saturation)
    hueSlider.value = Float(light.hue)
  }

  @IBAction func switchWasTapped(_ sender: Any) {
    guard let light = light else { return }
    let updatedLight = Light(lightName: light.lightName, isOn: lightSwitch.isOn, saturation: light.saturation, brightness: light.brightness, hue: light.hue)
    changeHandler?(updatedLight)
  }

  @IBAction func saturationSliderChanged(_ sender: Any) {
    saturationValueLabel.text = String(saturationSlider.value)
  }

  @IBAction func brightnessSliderChanged(_ sender: Any) {
    brightnessValueLabel.text = String(brightnessSlider.value)
  }

  @IBAction func hueSliderChanged(_ sender: Any) {
    hueValueLabel.text = String(hueSlider.value)
  }

}
