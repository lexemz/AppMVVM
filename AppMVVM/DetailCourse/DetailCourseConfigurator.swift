//
//  DetailCourseConfigurator.swift
//  AppMVVM
//
//  Created by Igor on 24.03.2022.
//

import Foundation

class DetailCourseConfigurator {
    func configure(view: DetailCourseViewController, course: Course) {
        let viewModel = DetailCourseViewModel(course: course)
        view.viewModel = viewModel
    }
}
