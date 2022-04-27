//
//  CourseCellViewModel.swift
//  AppMVVM
//
//  Created by Igor on 24.02.2022.
//

import Foundation

protocol CourseCellViewModelProtocol {
    var courseTitle: String { get }
    var courseInfo: String { get }
    var courseImage: Data? { get }
    
    init(course: Course)
}

class CourseCellViewModel: CourseCellViewModelProtocol {
    var courseTitle: String {
        course.name
    }
    
    var courseInfo: String {
        """
        Уроки: \(course.numberOfLessons)
        Тесты: \(course.numberOfTests)
        """
    }
    
    var courseImage: Data? {
        NetworkManager.shared.fetchImage(url: course.imageUrl)
    }
    
    private let course: Course!
    
    required init(course: Course) {
        self.course = course
    }
}

