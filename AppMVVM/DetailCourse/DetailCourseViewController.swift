//
//  ViewController.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import UIKit

class DetailCourseViewController: UIViewController {

    @IBOutlet var courseImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var lessonsCountLabel: UILabel!
    @IBOutlet var testsCountLabel: UILabel!
    
    var course: Course!
    var viewModel: DetailCourseViewModelProtocol! {
        didSet {
            title = viewModel.courseTitle
        }
    }
    
    private var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = DetailCourseViewModel(course: course)
        setupUI()
    }
    
    @IBAction func likeButtonPressed() {
        isFavorite.toggle()
        setupFavoriteStatus()
        UDManager.shared.saveDataUD(status: isFavorite, courseName: course.name)
    }
    
    private func setupUI () {
        lessonsCountLabel.text = "\(course.numberOfLessons) - Lessons"
        testsCountLabel.text = "\(course.numberOfTests) - Tests"
        
        guard let imageData = NetworkManager.shared.fetchImage(url: course.imageUrl) else { return }
        courseImageView.image = UIImage(data: imageData)
        
        isFavorite = UDManager.shared.getDataUD(courseName: course.name)
        setupFavoriteStatus()
    }
    
    private func setupFavoriteStatus() {
        likeButton.tintColor = isFavorite ? .red : .gray
    }

}

