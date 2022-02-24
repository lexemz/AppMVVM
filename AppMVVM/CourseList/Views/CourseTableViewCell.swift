//
//  CourseTableViewCell.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    var viewModel: CourseCellViewModelProtocol! {
        didSet {
            var content = defaultContentConfiguration()
            
            content.text = viewModel.courseTitle
            
            content.secondaryText = viewModel.courseInfo
            
            guard let imageData = viewModel.courseImage else { return }
            content.image = UIImage(data: imageData)
            
            contentConfiguration = content
        }
    }
}

