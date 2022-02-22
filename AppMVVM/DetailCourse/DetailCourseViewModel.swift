//
//  DetailCourseViewModel.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import Foundation

protocol DetailCourseViewModelProtocol {
    var courseTitle: String { get }
    
    init(course: Course)
}

class DetailCourseViewModel: DetailCourseViewModelProtocol {
    var courseTitle: String {
        course.name
    }
    
    // View - не должна ничего знать о модели данных
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
}
