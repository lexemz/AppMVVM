//
//  CourseCellConfigurator.swift
//  AppMVVM
//
//  Created by Igor on 24.03.2022.
//

import Foundation

class CourseCellConfigurator {
    func configure(view: CourseTableViewCell, course: Course) {
        let viewModel = CourseCellViewModel(course: course)
        view.viewModel = viewModel
    }
}
