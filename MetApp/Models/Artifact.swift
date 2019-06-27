//
//  Artifact.swift
//  MetApp
//
//  Created by Albert Yu on 6/26/19.
//  Copyright © 2019 AlbertLLC. All rights reserved.
//

// Data we need to get.
// ID
// Title
// Image
// Department
// Artist
// Object End Date
// Medium


import Foundation

struct Artifact: Decodable {
    private enum CodingKeys: String, CodingKey {
        case objectID
        case title
        case department
        case artistDisplayName
        case objectEndDate
        case medium
    }
    
    let objectID: Int
    let title: String
    let department: String
    let artistDisplayName: String
    let objectEndDate: Int
    let medium: String
}
