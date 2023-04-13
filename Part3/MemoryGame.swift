//
//  MemoryGame.swift
//  lec01
//
//  Created by 许智尧 on 2023/4/2.
//

import Foundation //contains array,dictionary etc

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards : Array<Card>
    private var judgeGroup: Array<Int?> = []
    
    
    private var indexOfTheOneAndOnlyFacedUpCard: Int? {
        get{ cards.indices.filter({cards[$0].isFacedUp}).oneAndOnly }
        set{ cards.indices.forEach{cards[$0].isFacedUp = ($0 == newValue)} }
    }
    

    
    mutating func shuffle(){
        cards.shuffle()
    }
    
        mutating func mychoose(_ card : Card){
            //argument in a function is defined as a let;self is  a immutable value
            if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
               !cards[chosenIndex].isFacedUp,
               !cards[chosenIndex].isMatched
            {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFacedUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                    cards[chosenIndex].isFacedUp = true
                }else{
                    indexOfTheOneAndOnlyFacedUpCard = chosenIndex
                }
            }
        }
    
        
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards[cards.firstIndex(where: { $0.id == card.id })!].id,
        !cards[cards.firstIndex(where: { $0.id == card.id })!].isFacedUp,
        !cards[cards.firstIndex(where: { $0.id == card.id })!].isMatched
        {
            if !judgeGroup.isEmpty {
                if ((judgeGroup[0]! / 4) == (chosenIndex / 4)) && ((judgeGroup.last ?? judgeGroup[0])! < chosenIndex) {
                    if judgeGroup.count < 4 {
                        judgeGroup.append(chosenIndex)
                    }
                    if judgeGroup.count == 4{
                        for index in 0..<judgeGroup.count{
                            cards[cards.firstIndex(where: { $0.id == judgeGroup[index]! })!].isMatched = true
                        }
                    }
                }else{
                    judgeGroup = []
                    judgeGroup.append(chosenIndex)
                    for index in 0..<cards.count{
                        cards[index].isFacedUp = false
                    }
                }
                cards[cards.firstIndex(where: { $0.id == card.id })!].isFacedUp = true
            }else{
                judgeGroup.append(chosenIndex)
            }
        }
    }
    
//
//     func firstId(_ cards: Array<Card>,_ id: Int) -> Int?{
//        var temp: Int
//        for index in 0..<cards.count {
//            temp = (cards[index].id == id) ? id : -1
//        }
//         return temp
//    }
//
    func getGroupIndexOfCard(_ card: Card){
//        cards.indices.forEach({cards[$0] == card})
    }
    
    
//        init(numberOfPhraseCards: Int, createCardContent:(Int) -> CardContent){         //use a function as a input argument
//            cards = []
//            //add numberOfPairsOfCards times 2 cards to cards array
//            for phraseIndex in 0..<numberOfPhraseCards{
//                let content = createCardContent(phraseIndex)         //functional programming
//                cards.append(Card(content: content, id: phraseIndex*4))
//                cards.append(Card(content: content, id: phraseIndex*4+1))
////                cards.append(Card(content: content, id: phraseIndex*4+2))
////                cards.append(Card(content: content, id: phraseIndex*4+3))
//            }
//            cards.shuffle()
//        }
    
    
    init(numberOfPhraseCards: Int, createCardContent:(Int) -> CardContent){         //use a function as a input argument
        cards = []
        //add numberOfPairsOfCards times 2 cards to cards array
        for phraseIndex in 0..<numberOfPhraseCards{
            let content = createCardContent(phraseIndex)         //functional programming
            cards.append(Card(content: content, id: phraseIndex))
        }
        cards.shuffle()
    }
    
    
    struct Card : Identifiable, Equatable{
        var isFacedUp = false
        var isMatched = false
        var content: CardContent
        var id: Int?
        
    }
}


extension Array{
    var oneAndOnly: Element?{
        if count == 1{
            return first
        }else{
            return nil
        }
    }
}
