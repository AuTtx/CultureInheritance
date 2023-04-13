//
//  ContentView.swift
//  lec01
//
//  Created by 许智尧 on 2023/3/29.
//



import SwiftUI

struct EmojiMemoryGameView: View {
    
    
    @ObservedObject  var game: EmojiMemoryGame
    //观察viewmodel which is a observable object and will publish some changes
    
    @ObservedObject  static var game1 = EmojiMemoryGame()
    @Namespace private var dealingNamespace
    
    var body: some View {
        VStack{
            gamebody
            deckBody
            HStack{
                restart
                Spacer()
                shuffle
            }
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
        .foregroundColor(.cyan)
    }
    
    @State private var dealt = Set<Int>()
    
    private func deal(_ card: EmojiMemoryGame.Card){
        dealt.insert(card.id!)
    }
    
    private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool{
         !dealt.contains(card.id!)
    }
    
    private func dealAnimation(for card: EmojiMemoryGame.Card) -> Animation{
        var delay = 0.0
        if let index = game.cards.firstIndex(where: {$0.id == card.id}){
            delay = Double(index) * (CardConstants.totalDealDuration / Double(game.cards.count))
        }
        return Animation.easeInOut(duration: CardConstants.dealDuration).delay(delay)
    }
    
    
    var gamebody: some View{
        AspectVGrid(items: game.cards,aspectRatio: 2/3){ card in
            if isUndealt(card) || card.isMatched && !card.isFacedUp{
//                Rectangle().opacity(0)
                Color.clear
            }else {
                MyCardView(card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .padding(4)
                    .aspectRatio(2/3,contentMode: .fit)
                    .transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale))
                    .onTapGesture {
                        withAnimation{
                            game.choose(card)
                        }
                    }
            }
        }
        
    }
    
    
    
    var deckBody: some View{
        ZStack{
            ForEach(game.cards.filter(isUndealt)){ card in
                MyCardView(card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
            }
        }
        .frame(width: 60,height: 90)
        .onTapGesture{
            for card in game.cards{
            withAnimation(dealAnimation(for: card)){
                    deal(card)
                }
            }
        }
    }
    
    var shuffle: some View {
        Button("洗牌"){
            withAnimation{
                game.shuffle()
            }
            
        }
    }
    
    var restart: some View{
        Button("再玩一把"){
            withAnimation{
                dealt = []
                game.restart()
            }
        }
    }
    
    
    private struct CardConstants{
        static let totalDealDuration: Double = 2
        static let dealDuration: Double = 0.5
    }
}
    
    
struct MyCardView: View{
    private let card : MemoryGame<String>.Card
    
    init(_ givenCard: EmojiMemoryGame.Card){
        self.card = givenCard
    }
    
    var body: some View{
        GeometryReader {geometry in
            ZStack{
                    //Pie todo...
                Text(card.isMatched ?  "🥳": card.content)
//                Text(card.content)
//                    .rotationEffect(Angle(degrees: card.isMatched ? 360 : 0))
                    .animation(Animation.easeInOut(duration: 2))
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
                    
//                    .rotationEffect(<#T##angle: Angle##Angle#>)
                }
            .modifier(Cardify(isFacedUp: card.isFacedUp))
        }
    }
    private func scale(thatFits size: CGSize ) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    
    
    private struct  DrawingConstants{
        static let fontScale:CGFloat = 0.8
        static let fontSize: CGFloat = 32
        
    }
}
//var add : some View{
//        Button{
//            if count<viewmodel.cards.count{
//                self.count+=1
//            }
//        } label: {
//            Image(systemName: "plus.circle")
//        }
//    }
//
//    var remove : some View{
//        Button {
//            if count>1{
//                self.count-=1
//            }
//        } label: {
//            Image(systemName: "minus.circle")
//        }
//    }

















struct CardContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
//        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
    }
}


