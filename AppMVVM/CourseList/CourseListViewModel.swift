//
//  CourseListViewModel.swift
//  AppMVVM
//
//  Created by Igor on 24.02.2022.
//

import Foundation

protocol CourseListViewModelProtocol {
    var courses: [Course] { get }
    
    func fetchCourses(completionHandler: @escaping () -> Void)
    func numberOfRows() -> Int// тк в VC метод отвечает за кол-во строк, то и тут делаем метод
    
    func getCellViewModel(at indexPath: IndexPath) -> CourseCellViewModelProtocol
}

class CourseListViewModel: CourseListViewModelProtocol {
    var courses: [Course] = []
    
    func fetchCourses(completionHandler: @escaping () -> Void) {
        NetworkManager.shared.fetchCourses { [unowned self] result in
            switch result {
                
            case .success(let courses):
                self.courses = courses
                completionHandler()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfRows() -> Int {
        courses.count
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> CourseCellViewModelProtocol {
        CourseCellViewModel(course: courses[indexPath.row])
    }
}

