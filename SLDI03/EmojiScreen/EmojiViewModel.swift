//
//  EmojiViewModel.swift
//  SLDI03
//
//  Created by Anna Ershova on 08.04.2022.
//

import Foundation
import Networking
import SwiftUI

final class EmojiViewModel: ObservableObject {
    @Injected var network: NetworkService?
    @Injected var parsed: ParsingJsonService?
    @Published var data: [EmojiModel] = []
    private var urls:[String] = [
        "https://emojihub.herokuapp.com/api/all/category_food_and_drink",
        "https://emojihub.herokuapp.com/api/all/group_face_positive",
        "https://emojihub.herokuapp.com/api/all/group_face_role",
        "https://emojihub.herokuapp.com/api/all/group_animal_reptile",
        "https://emojihub.herokuapp.com/api/all/category_travel_and_places"
    ]
    private var url = "https://emojihub.herokuapp.com/api/all/group_face_negative"
    var updatedData:Int? {
        didSet {
            self.data = []
            self.chooseEmojies()
            self.fetchEmoji()
        }
    }
    
    func fetchEmoji() {
        DispatchQueue.global(qos: .background).async { [self] in
            network?.request(path: url, completion: { data, error in
                if let error = error {
                    print("there is error: \(error.localizedDescription)")
                }
                self.parsed?.parseJson(data: data, completion: {(res: [EmojiModel]?) in
                })
                DispatchQueue.main.async {
                    let res = self.parsed?.saved as? [EmojiModel]
                    self.data = res ?? []
                }
            })
        }
    }
    
    func chooseEmojies() {
        if let random = self.urls.randomElement() {
            self.url = random
        }
    }
}
