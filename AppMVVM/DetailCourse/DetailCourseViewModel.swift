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
    var isFavorite: Bool { get }
    
    var viewModelDidChange: ((DetailCourseViewModelProtocol) -> Void)? { get set }
    
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
    
    var viewModelDidChange: ((DetailCourseViewModelProtocol) -> Void)?
    
    var isFavorite: Bool {
        get {
            UDManager.shared.getDataUD(courseName: course.name)
        } set {
            UDManager.shared.saveDataUD(status: newValue, courseName: course.name)
            viewModelDidChange?(self)
        }
    }
    
    // View - не должна ничего знать о модели данных
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
    
    func favoriteButtonPressed() {
        isFavorite.toggle()
    }
}
