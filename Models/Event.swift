//
//  Event.swift
//  TestApp
//
//  Created by Евгений on 13.08.17.
//  Copyright © 2017 Евгений. All rights reserved.
//

import Foundation

protocol ItemsProtocol {}

class Event: ItemsProtocol {
    var startTime: Date?
    var endTime: Date?
    var name: String!
}
