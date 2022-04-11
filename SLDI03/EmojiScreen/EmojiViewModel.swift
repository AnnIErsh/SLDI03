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
    @Injected var parsed: ParsingJsonService?
    private let url = "https://emojihub.herokuapp.com/api/random"
    @Published var data: [EmojiModel] = []
    
    var dataCopy:Int? {
        didSet {
            self.fetchEmoji()
        }
    }
    
    func fetchEmoji() {
        network?.request(path: url, completion: { dat, error in
            if let error = error {
                print("there is error: \(error.localizedDescription)")
            }
            self.parsed?.parseJson(data: dat, completion: {(res: EmojiModel?) in
                
            })
        })
    }
}
