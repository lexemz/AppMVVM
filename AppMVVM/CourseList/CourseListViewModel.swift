//
//  CourseListViewModel.swift
//  AppMVVM
//
//  Created by Igor on 24.02.2022.
//

import Foundation

protocol CourseListViewModelProtocol {
    func fetchCourses(completionHandler: @escaping () -> Void)
    func numberOfRows() -> Int// тк в VC метод отвечает за кол-во строк, то и тут делаем метод
    
    func getCoutse(at indexPath: IndexPath) -> Course
}

class CourseListViewModel: CourseListViewModelProtocol {
    private var courses: [Course] = []
    
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
    
    func getCoutse(at indexPath: IndexPath) -> Course {
        courses[indexPath.row]
    }
}

