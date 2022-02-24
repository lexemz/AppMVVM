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
    
    func getCellViewModel(at indexPath: IndexPath) -> CourseCellViewModelProtocol
    func getDetailsViewModel(at indexPath: IndexPath) -> DetailCourseViewModelProtocol
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
    
    // собрать ViewModel ячейки, для конфигурации её отображения
    func getCellViewModel(at indexPath: IndexPath) -> CourseCellViewModelProtocol {
        CourseCellViewModel(course: courses[indexPath.row])
    }
    
    func getDetailsViewModel(at indexPath: IndexPath) -> DetailCourseViewModelProtocol {
        DetailCourseViewModel(course: courses[indexPath.row])
    }
}

