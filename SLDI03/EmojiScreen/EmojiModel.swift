//
//  EmojiModel.swift
//  SLDI03
//
//  Created by Anna Ershova on 08.04.2022.
//

import Foundation

struct EmojiModel: Hashable, Codable {
    let name: String
    let category: String
    let group: String
    let htmlCode: [String]
    let unicode: [String]
}
