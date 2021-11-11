//
//  TasksViewController.swift
//  CalendarPlaner
//
//  Created by Никита Иващенков on 10/11/2021.
//  Copyright © 2021 Никита Иващенков. All rights reserved.
//

import UIKit
import FSCalendar



class TasksViewController: UIViewController {
    
    var calendarHeightConstraint: NSLayoutConstraint!
    
    private var calendar:  FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    let showHideButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open Calendar", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .normal)
        button.titleLabel?.font = buttonTextLabelFont
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Schedule"
        
        calendar.delegate = self
        calendar.dataSource = self
        
        calendar.scope = .week
        
        setConstraints()
        swipeAction()
        
        showHideButton.addTarget(self,
                                 action: #selector(showHideButtonTapped),
                                 for: .touchUpInside)
    }
    
    @objc func showHideButtonTapped() {
        
        if calendar.scope == .week {
            calendar.setScope(.month, animated: true)
            showHideButton.setTitle("Close Calendar", for: .normal)
        } else {
            calendar.setScope(.week, animated: true)
            showHideButton.setTitle("Open Calendar", for: .normal)
        }
    }
    
    // MARK: - SwipeGestureRecognizer
    
    func swipeAction() {
        
        let swipeUp = UISwipeGestureRecognizer(target: self,
                                               action: #selector(handleSwipe))
        swipeUp.direction = .up
        calendar.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self,
                                                 action: #selector(handleSwipe))
        swipeDown .direction = .down
        calendar.addGestureRecognizer(swipeDown)
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        
        switch gesture.direction {
        case .up:
            showHideButtonTapped()
        case .down:
            showHideButtonTapped()
        default:
            break
        }
    }
}

// MARK: - FSCalendarDataSource, FSCalendarDelegate

extension TasksViewController: FSCalendarDataSource, FSCalendarDelegate {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint.constant = bounds.height
        view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
    }
}

// MARK: - SetConstraints

extension TasksViewController {
    
    func setConstraints() {
        
        view.addSubview(calendar)
        
        calendarHeightConstraint = NSLayoutConstraint(item: calendar,
                                                      attribute: .height,
                                                      relatedBy: .equal,
                                                      toItem: nil,
                                                      attribute: .notAnAttribute,
                                                      multiplier: 1,
                                                      constant: 300)
        calendar.addConstraint(calendarHeightConstraint)
        
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        view.addSubview(showHideButton)
        
        NSLayoutConstraint.activate([
            showHideButton.topAnchor.constraint(equalTo: calendar.bottomAnchor),
            showHideButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            showHideButton.widthAnchor.constraint(equalToConstant: 100),
            showHideButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
