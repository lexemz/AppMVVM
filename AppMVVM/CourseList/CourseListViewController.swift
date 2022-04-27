//
//  CoursesTableViewController.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import UIKit

class CourseListViewController: UITableViewController {
    var viewModel: CourseListViewModelProtocol! {
        didSet {
            // Слабый захват можно опустить, так как экран стартовый
            // После загрузки данных нужно обновить таблицу - этот метод это и делает
            viewModel.fetchCourses { [weak self] in
                self?.tableView.reloadData()
                self?.activityIndicator?.stopAnimating()
            }
        }
    }
    
    private var activityIndicator: UIActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let counfigurator = CourseListConfigurator()
        counfigurator.configure(view: self)
        setupUI()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailCourseViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let configurator = DetailCourseConfigurator()
        configurator.configure(view: detailVC, course: viewModel.getCoutse(at: indexPath))
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
        
        let configurator = CourseCellConfigurator()
        configurator.configure(view: cell, course: viewModel.getCoutse(at: indexPath))
        
        return cell
    }
}
