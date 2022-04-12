//
//  EmojiScreen.swift
//  SLDI03
//
//  Created by Anna Ershova on 08.04.2022.
//

import SwiftUI

struct EmojiScreen: View {
    @ObservedObject var emojiViewModel: EmojiViewModel = .init()
    let columns = [GridItem(.adaptive(minimum: 80))]
    
    var body: some View {
        Button {
            self.emojiViewModel.updatedData = 1
        } label: {
            Text("Update").frame(height: 50)
        }
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(emojiViewModel.data, id: \.self) { item in
                    VStack {
                        Text(item.unicode[0])
                        let filtered = String(item.unicode[0].unicodeScalars.filter {
                            CharacterSet.alphanumerics.contains($0)
                        })
                        let str = filtered.replacingOccurrences(of: "U", with: "")
                        let tmp = String(UnicodeScalar(Int(str, radix: 16)!)!)
                        Image(uiImage: str.convertEmojiToImage(text: tmp, size: 100))
                    }
                }
            }
            .padding(.horizontal)
            .onAppear {
                emojiViewModel.updatedData = 1
            }
        }
        .frame(maxHeight: .infinity)
    }
}

