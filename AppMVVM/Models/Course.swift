//
//  Course.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import Foundation

struct Course: Decodable {
    let name: String
    let imageUrl: URL
    let nubmerOfLessons: Int
    let numberOfTests: Int
}
