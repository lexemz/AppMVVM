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
            viewModel.viewModelDidChange = { [weak self] viewModel in
                self?.setupFavoriteStatus(viewModel.isFavorite)
            }
            
            title = viewModel.courseTitle
            lessonsCountLabel.text = viewModel.numberOfLessons
            testsCountLabel.text = viewModel.numberOfTests
            
            guard let imageData = viewModel.imageData else { return }
            courseImageView.image = UIImage(data: imageData)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = DetailCourseViewModel(course: course)
        setupUI()
    }
    
    @IBAction func likeButtonPressed() {
        viewModel.favoriteButtonPressed()
    }
    
    private func setupUI () {
        setupFavoriteStatus(viewModel.isFavorite)
    }
    
    private func setupFavoriteStatus(_ status: Bool) {
        likeButton.tintColor = status ? .red : .gray
    }
}

