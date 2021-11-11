//
//  ScheduleTableViewCell.swift
//  CalendarPlaner
//
//  Created by Никита Иващенков on 11/11/2021.
//  Copyright © 2021 Никита Иващенков. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    let lessonName = UILabel(text: "Программирование",
                             font: UIFont.avenirNextDemiBold20())
    
    let teacherName = UILabel(text: "Антонов Антон Анатольевич",
                              font: UIFont.avenirNext20(),
                              aligment: .right)
    
    let lessonTime = UILabel(text: "08:00",
                             font: UIFont.avenirNextDemiBold20())
    
    let typeLabel = UILabel(text: "Тип:",
                            font: UIFont.avenirNext14(),
                            aligment: .right)
    
    let lessonType = UILabel(text: "Лекция",
                             font: UIFont.avenirNextDemiBold14())
    
    let buildingLabel = UILabel(text: "Корпус:",
                                font: UIFont.avenirNext14(),
                                aligment: .right)
    
    let lessonBuilding = UILabel(text: "1",
                                 font: UIFont.avenirNextDemiBold14())
    
    let audLabel = UILabel(text: "Аудитория:",
                           font: UIFont.avenirNext14(),
                           aligment: .right)
    
    let lessonAud = UILabel(text: "101",
                            font: UIFont.avenirNextDemiBold14())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setConstraints()
    }
    
    func setConstraints() {
        
        let topStackView = UIStackView(
            arrangedSubview: [lessonName, teacherName],
            axis: .horizontal,
            spacing: 10,
            distribution: .fillEqually
        )
        
        self.addSubview(topStackView)

        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            topStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        self.addSubview(lessonTime)

        NSLayoutConstraint.activate([
            lessonTime.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            lessonTime.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            lessonTime.widthAnchor.constraint(equalToConstant: 100),
            lessonTime.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        let bottomStackView = UIStackView(
            arrangedSubview: [typeLabel,
                              lessonType,
                              buildingLabel,
                              lessonBuilding,
                              audLabel,
                              lessonAud],
            axis: .horizontal,
            spacing: 5,
            distribution: .fillProportionally
        )
        
        self.addSubview(bottomStackView)

        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            bottomStackView.leadingAnchor.constraint(equalTo: lessonTime.trailingAnchor, constant: 5),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            bottomStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
