//
//  GameDetailView.swift
//  UI_Practice2
//
//  Created by Harikrishnan K M on 13/09/23.
//

import SwiftUI

struct GameDetailView: View {
    let emojis = ["👻","🎃","🕷️","😈","🤡","👽","☠️","🤖","😱","🪼","🦕"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack{
            Text("Let's Play")
                .font(.headline)
                .fontWeight(.heavy)
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjuster
            
        }
        .padding()
        
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
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
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "minus.circle.fill")
    }
     
    var cardAdder: some View {
        return cardCountAdjuster(by: 1, symbol: "plus.circle.fill")
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
                Group{
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ? 0 : 1)
            }
            .onTapGesture{
                isFaceUp.toggle()
            }
        }
    }
}
