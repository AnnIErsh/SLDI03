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
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(emojiViewModel.data, id: \.self) { item in
                    Text(item.name)
                }
            }
            .padding(.horizontal)
            .onAppear {
                emojiViewModel.dataCopy = 1
            }
        }
        .frame(maxHeight: 300)
    }
}
