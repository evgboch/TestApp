//
//  ViewController.swift
//  TestApp
//
//  Created by Евгений on 11.08.17.
//  Copyright © 2017 Евгений. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet fileprivate weak var _tableView: UITableView!

    //MARK: Private
    fileprivate var _arrayOfItems = Array<ItemsProtocol>()
    fileprivate var _dataSource = ItemsDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _arrayOfItems = _dataSource.arrayOfItems()
        registerNibs()
    }
    
    private func registerNibs() {
        _tableView.register(UINib(nibName: String(describing: EventTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: "EventTableViewCell")
        _tableView.register(UINib(nibName: String(describing: NoticeTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: "NoticeTableViewCell")
        _tableView.register(UINib(nibName: String(describing: MoveTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: "MoveTableViewCell")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "eventSegue" {
            let controller = segue.destination as! EventDetailViewController
            if let indexPath = _tableView.indexPathForSelectedRow {
                let item = _arrayOfItems[indexPath.row] as! Event
                controller.name = item.name
                controller.startTime = item.startTime
                controller.endTime = item.endTime
            }
        } else if segue.identifier == "noticeSegue" {
            let controller = segue.destination as! NoticeDetailViewController
            if let indexPath = _tableView.indexPathForSelectedRow {
                let item = _arrayOfItems[indexPath.row] as! Notice
                controller.gate = item.gate
                controller.flightDate = item.flightDate
            }
        } else if segue.identifier == "moveSegue" {
            let controller = segue.destination as! MoveDetailViewController
            if let indexPath = _tableView.indexPathForSelectedRow {
                let item = _arrayOfItems[indexPath.row] as! Move
                controller.fromPlace = item.fromPlace
                controller.toPlace = item.toPlace
                controller.estimateTime = item.estimateTime
            }
        }
    }
}

//MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if (cell?.reuseIdentifier == "EventTableViewCell") {
            self.performSegue(withIdentifier: "eventSegue", sender: self)
        }
        else if (cell?.reuseIdentifier == "NoticeTableViewCell") {
            self.performSegue(withIdentifier: "noticeSegue", sender: self)
        }
        else if (cell?.reuseIdentifier == "MoveTableViewCell") {
            self.performSegue(withIdentifier: "moveSegue", sender: self)
        }

    }
}

//MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _arrayOfItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = _arrayOfItems[indexPath.row]
        switch item {
        case is Event:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EventTableViewCell.self), for: indexPath) as! EventTableViewCell
            cell.setup(with: item as! Event)
            return cell

        case is Notice:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NoticeTableViewCell.self), for: indexPath) as! NoticeTableViewCell
            cell.setup(with: item as! Notice)
            return cell

        case is Move:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MoveTableViewCell.self), for: indexPath) as! MoveTableViewCell
            cell.setup(with: item as! Move)
            return cell

        default:
            return UITableViewCell()
        }
    }
}

