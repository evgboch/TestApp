//
//  NoticeDetailViewController.swift
//  TestApp
//
//  Created by Евгений on 13.08.17.
//  Copyright © 2017 Евгений. All rights reserved.
//

import UIKit

class NoticeDetailViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet fileprivate weak var _flightDateLabel: UILabel!
    @IBOutlet fileprivate weak var _gateLabel: UILabel!

    var flightDate: Date?
    var gate: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        _flightDateLabel.text = "Flight Date: \(String(describing: flightDate!))"
        _gateLabel.text = "Gate: \(gate!)"
    }
}

