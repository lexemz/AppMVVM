//
//  DetailCourseViewModel.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import Foundation

protocol DetailCourseViewModelProtocol {
    var courseTitle: String { get }
    var numberOfLessons: String { get }
    var numberOfTests: String { get }
    var imageData: Data? { get }
    var isFavorite: Box<Bool> { get }
    
    init(course: Course)
    
    func favoriteButtonPressed()
}

class DetailCourseViewModel: DetailCourseViewModelProtocol {
    var courseTitle: String {
        course.name
    }
    
    var numberOfLessons: String {
        "\(course.numberOfLessons) - Lessons"
    }
    
    var numberOfTests: String {
        "\(course.numberOfTests) - Tests"
    }
    
    var imageData: Data? {
        NetworkManager.shared.fetchImage(url: course.imageUrl)
    }
    
    var isFavorite: Box<Bool>
    
    // View - не должна ничего знать о модели данных поэтому private 
    private let course: Course
    
    required init(course: Course) {
        isFavorite = Box(UDManager.shared.getDataUD(courseName: course.name))
        self.course = course
    }
    
    func favoriteButtonPressed() {
        isFavorite.value.toggle()
        UDManager.shared.saveDataUD(status: isFavorite.value, courseName: course.name)
    }
}
