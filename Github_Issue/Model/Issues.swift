//
//  Issues.swift
//  Github_Issue
//
//  Created by Jaleel Davidson on 9/9/22.
//

import Foundation

struct Issues: Decodable {
    var url: String?
    var title: String?
    var user: User
    var state: String?
    var comments: Int?
    var created_at: String?
}

struct User: Decodable {
    var login: String?
}
