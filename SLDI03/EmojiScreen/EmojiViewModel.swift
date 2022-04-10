//
//  EmojiViewModel.swift
//  SLDI03
//
//  Created by Anna Ershova on 08.04.2022.
//

import Foundation
import Networking

final class EmojiViewModel: ObservableObject {
    @Injected var network: NetworkService?
    private let url = "https://emojihub.herokuapp.com/api/random"
    @Published var data: [EmojiModel] = []
    
    var dataCopy:Int? {
        didSet {
//            data = [EmojiModel(id: UUID(), name: "one"),
//                    EmojiModel(id: UUID(), name: "two"),
//                    EmojiModel(id: UUID(), name: "three")]
            self.fetchEmoji()
        }
    }
    
    func fetchEmoji() {
        network?.request(path: url, completion: { data, error in
            if let error = error {
                print("there is error: \(error.localizedDescription)")
            }
            print(data as Any)
        })
    }
}
