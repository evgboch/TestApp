//
//  EventDetailViewController.swift
//  TestApp
//
//  Created by Евгений on 13.08.17.
//  Copyright © 2017 Евгений. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet fileprivate weak var _nameLabel: UILabel!
    @IBOutlet fileprivate weak var _startTimeLabel: UILabel!
    @IBOutlet fileprivate weak var _endTimeLabel: UILabel!

    var startTime: Date?
    var endTime: Date?
    var name: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        _nameLabel.text = name
        _startTimeLabel.text = "Start time: \(String(describing: startTime!))"
        _endTimeLabel.text = "End time: \(String(describing: startTime!))"
    }
}
