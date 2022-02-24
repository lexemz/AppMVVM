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
                self.activityIndicator?.stopAnimating()
            }
        }
    }
    
    private var activityIndicator: UIActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CourseListViewModel()
        setupUI()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailCourseViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        detailVC.viewModel = viewModel.getDetailsViewModel(at: indexPath)
    }
    
    private func setupUI() {
        title = "Courses"
        tableView.rowHeight = 100
        activityIndicator = showActivityIndicator()
    }
    
    
    private func showActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        
        let navigationBarHeight = navigationController?.navigationBar.frame.size.height ?? 0
        let tabBarHeight = tabBarController?.tabBar.frame.size.height ?? 0
        
        activityIndicator.center = CGPoint(
            x: view.frame.size.width / 2.0,
            y: view.frame.size.height / 2.0 - navigationBarHeight - tabBarHeight)
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
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

