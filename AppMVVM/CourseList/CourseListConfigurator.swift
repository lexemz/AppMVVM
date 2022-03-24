//
//  CourseListConfigurator.swift
//  AppMVVM
//
//  Created by Igor on 24.03.2022.
//

import Foundation

class CourseListConfigurator {
    func configure(view: CourseListViewController) {
        let viewModel = CourseListViewModel()
        view.viewModel = viewModel
    }
}
