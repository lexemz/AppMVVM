//
//  CoursesTableViewController.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import UIKit

class CourseListViewController: UITableViewController {
    private var viewModel: CourseListViewModelProtocol! {
        didSet {
            viewModel.fetchCourses {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CourseListViewModel()
        setupUI()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailCourseViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        detailVC.course = viewModel.courses[indexPath.row]
    }
    
    private func setupUI() {
        title = "SwiftBook Courses"
        tableView.rowHeight = 100
    }

}

// MARK: - Table view data source

extension CourseListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell") as! CourseTableViewCell
        
        cell.viewModel = viewModel.getCellViewModel(at: indexPath)
        
        return cell
    }
}

