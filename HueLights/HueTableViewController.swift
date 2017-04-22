//
//  HueTableViewController.swift
//  HueLights
//
//  Created by Wu, Samuel on 4/22/17.
//  Copyright © 2017 BothPoints. All rights reserved.
//

import UIKit

final class HueTableViewController: UITableViewController {

    private let lightManager = LightManager()

    private var lights: [Light]? {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
        lightManager.getLights { [weak self] lights in

            guard let strongSelf = self else { return }
            strongSelf.lights = lights
        }
    }

    private func setUpTableView() {
        
        let controlCell = UINib(nibName: "HueLightControlCell", bundle: nil)
        tableView.register(controlCell, forCellReuseIdentifier: HueLightControlCell.Identifier)
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = 300
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lights?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: HueLightControlCell.Identifier) as? HueLightControlCell,
            let light = lights?[indexPath.row]
            else { return UITableViewCell() }

        cell.configure(with: light)
        cell.changeHandler = { [weak self] light in
            guard let strongSelf = self else { return }
            
            strongSelf.lightManager.update(light)
        }

        return cell
    }
}
