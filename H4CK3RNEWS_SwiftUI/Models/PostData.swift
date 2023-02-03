//
//  PostData.swift
//  H4CK3RNEWS_SwiftUI
//
//  Created by Toni Lozano Fernández on 3/2/23.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let url: String?
    let points: Int
}
