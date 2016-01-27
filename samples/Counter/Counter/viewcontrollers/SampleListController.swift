//
//  SampleListController.swift
//  Counter
//
//  Created by wookyoung on 1/26/16.
//  Copyright © 2016 factorcat. All rights reserved.
//

import UIKit
import UIDesign

class SampleListController: UITableViewController {

    let samples: [UIViewController.Type] = [
        ViewController.self,
        CounterAndStackViewController.self,
        InspectableViewController.self,
        SubViewController.self,
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = String(self.dynamicType)

        let cellIdentifier = "LabelCell"
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier:cellIdentifier)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return samples.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return isipad ? 100 : 50
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LabelCell", forIndexPath: indexPath)
        cell.textLabel?.text = String(samples[indexPath.row])
        cell.accessoryType = .DisclosureIndicator
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let type: UIViewController.Type = samples[indexPath.row]
        let identifier = String(type)
        let controller = self.storyboard!.instantiateViewControllerWithIdentifier(identifier)
        controller.title = identifier
        self.navigationController?.pushViewController(controller, animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}