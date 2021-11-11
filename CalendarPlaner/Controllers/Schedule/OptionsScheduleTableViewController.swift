//
//  OptionsScheduleViewController.swift
//  CalendarPlaner
//
//  Created by Никита Иващенков on 11/11/2021.
//  Copyright © 2021 Никита Иващенков. All rights reserved.
//

import UIKit

class OptionsScheduleTableViewController: UITableViewController {
    
    private let idOptionsScheduleCell = "idOptionsScheduleCell"
    private let idOptionsScheduleHeader = "idOptionsScheduleHeader"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OptionsScheduleTableViewCell.self,
                           forCellReuseIdentifier: idOptionsScheduleCell)
        tableView.register(HeaderOptionsScheduleTableViewCell.self,
                           forHeaderFooterViewReuseIdentifier: idOptionsScheduleHeader)
        tableView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        tableView.separatorStyle = .none
        
        title = "Option Schedule"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return 4
        case 2: return 1
        case 3: return 1
        default: return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: idOptionsScheduleCell,
            for: indexPath
            ) as? OptionsScheduleTableViewCell else { return UITableViewCell() }
        
        cell.cellConfigure(indexPath: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: idOptionsScheduleHeader
            ) as? HeaderOptionsScheduleTableViewCell
            else { return UITableViewHeaderFooterView() }
        header.headerConfigure(section: section)
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
