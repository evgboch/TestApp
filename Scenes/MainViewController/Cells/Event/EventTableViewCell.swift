//
//  EventTableViewCell.swift
//  TestApp
//
//  Created by Евгений on 12.08.17.
//  Copyright © 2017 Евгений. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet fileprivate weak var _nameLabel: UILabel!
    @IBOutlet fileprivate weak var _startDateLabel: UILabel!
    @IBOutlet fileprivate weak var _endDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(with event: Event) {
        _nameLabel.text = event.name
        _startDateLabel.text = event.startTime?.description
        _endDateLabel.text = event.endTime?.description
    }
}
