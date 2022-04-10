//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by 유연탁 on 2022/02/23.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
