//
//  ViewController.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var courseImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var lessonsCountLabel: UILabel!
    @IBOutlet var testsCountLabel: UILabel!
    
    var course: Course!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

