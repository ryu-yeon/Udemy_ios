//
//  PostData.swift
//  H4X0R News
//
//  Created by 유연탁 on 2022/05/09.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let points: Int
    let title: String
    let url: String?
    let objectID: String
}
