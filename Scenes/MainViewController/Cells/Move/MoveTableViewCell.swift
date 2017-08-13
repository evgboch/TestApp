//
//  MoveTableViewCell.swift
//  TestApp
//
//  Created by Евгений on 13.08.17.
//  Copyright © 2017 Евгений. All rights reserved.
//

import UIKit

class MoveTableViewCell: UITableViewCell {

    @IBOutlet fileprivate weak var _nameLabel: UILabel!
    @IBOutlet fileprivate weak var _fromLabel: UILabel!
    @IBOutlet fileprivate weak var _toLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(with move: Move) {
        _nameLabel.text = move.name
        _fromLabel.text = move.fromPlace?.description
        _toLabel.text = move.toPlace?.description
    }
}
