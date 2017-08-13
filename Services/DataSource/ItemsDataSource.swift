//
//  ItemsDataSource.swift
//  TestApp
//
//  Created by Евгений on 12.08.17.
//  Copyright © 2017 Евгений. All rights reserved.
//

import UIKit

class ItemsDataSource {

    fileprivate let cities = ["Moscow", "London", "St. Petersburg", "Riga", "Liverpool", "Barcelona", "Bangkok", "Tokyo", "Rome", "Tbilisi", "Budapest", "Oslo"]
    fileprivate let events = ["Concert", "Trip", "Shopping", "Work", "Training"]
    fileprivate let gates = ["17A", "2B", "10C", "8D", "7E"]

    func arrayOfItems() -> Array<ItemsProtocol> {
        var arrayOfItems = Array<ItemsProtocol>()

        let generalRandom = random(between: 10, max: 100)
        let numberOfEvents = random(between: 1, max: (generalRandom - 2))
        let numberOfNotices = random(between: 1, max: (generalRandom - numberOfEvents - 1))
        let numberOfMoves = generalRandom - numberOfEvents - numberOfNotices

        for _ in 1...numberOfEvents {
            let event = Event()
            event.name = randomString(which: .event)
            event.startTime = randomDate(after: nil)
            event.endTime = randomDate(after: event.startTime)
            arrayOfItems.append(event)
        }

        for i in 1...numberOfNotices {
            var notice = Notice()
            notice.name = "Flight #\(i)"
            notice.flightDate = randomDate(after: nil)
            notice.gate = randomString(which: .gate)
            arrayOfItems.append(notice)
        }

        for i in 1...numberOfMoves {
            let move = Move()
            move.name = "Voyage #\(i)"
            move.fromPlace = randomString(which: .city)
            move.toPlace = randomString(which: .city)
            move.estimateTime = randomDate(after: nil).timeIntervalSince1970
            arrayOfItems.append(move)
        }
        return arrayOfItems
    }
}

//MARK: Private
extension ItemsDataSource {

    fileprivate func random(between min: Int, max: Int) -> Int {
        let random = Int(arc4random_uniform(UInt32(max - min) + 1)) + min
        return random
    }

    fileprivate func randomDate(after startDate: Date?) -> Date {
        guard let date = startDate else {
            let randomTime = TimeInterval(arc4random_uniform(UInt32.max))
            return Date(timeIntervalSince1970: randomTime)
        }

        let firstDate = arc4random_uniform(UInt32.max - UInt32(date.timeIntervalSince1970))
        let secondDate = TimeInterval(firstDate) + date.timeIntervalSince1970
        let resDate = Date(timeIntervalSince1970: secondDate)
        return resDate
    }

    fileprivate func randomString(which: StringType) -> String {
        switch which {
        case .city:
            let city = cities[random(between: 0, max: cities.count-1)]
            return city

        case .gate:
            let gate = gates[random(between: 0, max: gates.count-1)]
            return gate

        case .event:
            let event = events[random(between: 0, max: events.count-1)]
            return event
        }
    }

    fileprivate enum StringType {
        case city
        case gate
        case event
    }
}


