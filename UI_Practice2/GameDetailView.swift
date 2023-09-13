//
//  GameDetailView.swift
//  UI_Practice2
//
//  Created by Harikrishnan K M on 13/09/23.
//

import SwiftUI

struct GameDetailView: View {
    let emojis = ["👻","🎃","🕷️","😈","🤡","👽","☠️","🤖","😱"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack{
            cards
            cardCountAdjuster
        }
        .padding()
    }
    
    var cards: some View{
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjuster: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cardRemover: some View{
        Button(action: {
            if cardCount > 1
            {
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "plus.circle.fill")
        })
    }
    
    var cardAdder: some View {
        Button(action: {
            if cardCount < emojis.count {
                cardCount += 1
            }
        }, label: {
            Image(systemName: "minus.circle.fill")
        })
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView()
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture{
            isFaceUp.toggle()
        }
    }
}
