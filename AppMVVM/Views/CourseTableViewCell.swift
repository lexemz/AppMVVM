//
//  CourseTableViewCell.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    func configure(with course: Course) {
        var content = defaultContentConfiguration()
        
        content.text = course.name
        content.image = nil // TODO: make network load
        content.secondaryText = """
                                Уроки: \(course.nubmerOfLessons)
                                Тесты: \(course.numberOfTests)
                                """
    }
}
