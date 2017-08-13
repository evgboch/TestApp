//
//  NoticeTableViewCell.swift
//  TestApp
//
//  Created by Евгений on 13.08.17.
//  Copyright © 2017 Евгений. All rights reserved.
//

import UIKit

class NoticeTableViewCell: UITableViewCell {

    @IBOutlet fileprivate weak var _nameLabel: UILabel!
    @IBOutlet fileprivate weak var _dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(with notice: Notice) {
        _nameLabel.text = notice.name
        _dateLabel.text = notice.flightDate?.description
    }
}
