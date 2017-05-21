//
//  JSONLoader.swift
//  HueLights
//
//  Created by Wu, Samuel on 5/21/17.
//  Copyright © 2017 BothPoints. All rights reserved.
//

import Foundation

final class JSONLoader {

  static func load(file name: String) -> [String: Any]? {
    guard let path = Bundle(for: JSONLoader.self).url(forResource: name, withExtension: "json"), let data = try? Data(contentsOf: path) else {
      assertionFailure("Unable to read data from path")
      return nil
    }

    guard let responseJSON = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]  else {
      assertionFailure("Unable to load JSON")
      return nil
    }

    return responseJSON
  }
}
