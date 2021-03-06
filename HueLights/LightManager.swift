//
//  LightManager.swift
//  HueLights
//
//  Created by Wu, Samuel on 4/22/17.
//  Copyright © 2017 BothPoints. All rights reserved.
//

import Foundation

final class LightManager {

    private static let APIKey = "WB54XOiuKaCjzHEB7JW2BC0hce4kN27eX9MhkkD1"
    private static let APIURL = "http://10.3.125.234/api/"
    private static let LightsEndPoint = "lights/"

    private enum Method: String {
        case get = "GET"
        case put = "PUT"
    }

    func getLights(completion: @escaping (([Light]?) -> ())) {

        guard let url = URL(string: LightManager.APIURL + LightManager.APIKey + LightManager.LightsEndPoint) else { return }

        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = Method.get.rawValue

        let task = session.dataTask(with: request) { (data, response, error) in

            guard let data = data, error == nil, let responseJSON = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                print("error was \(error.debugDescription)")
                return
            }

            let lights = LightParser.parse(jsonString: responseJSON)

            DispatchQueue.main.async {
                completion(lights)
            }

        }
        
        task.resume()
    }

    func update(_ light: Light) {

        guard let url = URL(string: LightManager.APIURL + LightManager.APIKey + "/" + LightManager.LightsEndPoint + light.lightName + "/state") else { return }

        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = Method.put.rawValue

        let dataToSend = "{\"on\": \(light.isOn)}"

        request.httpBody = dataToSend.data(using: String.Encoding.utf8)

        let task = session.dataTask(with: request) { (data, response, error) in

            guard let data = data, error == nil, let responseJSON = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                print("error was \(error.debugDescription)")
                return
            }

            print(responseJSON ?? "")
        }

        task.resume()

    }

}
