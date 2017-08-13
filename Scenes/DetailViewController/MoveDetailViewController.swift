//
//  MoveDetailViewController.swift
//  TestApp
//
//  Created by Евгений on 13.08.17.
//  Copyright © 2017 Евгений. All rights reserved.
//

import UIKit

class MoveDetailViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet fileprivate weak var _fromPlaceLabel: UILabel!
    @IBOutlet fileprivate weak var _toPlaceLabel: UILabel!
    @IBOutlet fileprivate weak var _estimateTimeLabel: UILabel!

    var fromPlace: String?
    var toPlace: String?
    var estimateTime: TimeInterval?

    override func viewDidLoad() {
        super.viewDidLoad()

        _toPlaceLabel.text = "From: \(toPlace!)"
        _fromPlaceLabel.text = "To: \(fromPlace!)"
        _estimateTimeLabel.text = "Estimate: \(String(describing: estimateTime!))"
    }
}
