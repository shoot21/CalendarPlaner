//
//  ViewController.swift
//  CalendarPlaner
//
//  Created by Никита Иващенков on 10/11/2021.
//  Copyright © 2021 Никита Иващенков. All rights reserved.
//

import UIKit

// fix imageView for tabBar
private let scheduleImageName = "calendar.badge.clock"
private let tasksImageName = "text.badge.checkmark"
private let contactImageName = "rectangle.stack.person.crop"

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        
        let scheduleViewController = createNavController(vc: ScheduleViewController(),
                                                         itemName: "Schedule",
                                                         itemImage: scheduleImageName)
        
        let tasksViewController = createNavController(vc: TasksViewController(),
                                                         itemName: "Tasks",
                                                         itemImage: tasksImageName)
        
        let contactsViewController = createNavController(vc: ContactsViewController(),
                                                         itemName: "Contacts",
                                                         itemImage: contactImageName)
        
        viewControllers = [scheduleViewController, tasksViewController, contactsViewController]
    }
    
    private func createNavController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        
        let item = UITabBarItem(
            title: itemName,
            image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 10,
                                                                                 left: 0,
                                                                                 bottom: 0,
                                                                                 right: 0)),
            tag: 0
        )
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        
        return navController
    }
}

