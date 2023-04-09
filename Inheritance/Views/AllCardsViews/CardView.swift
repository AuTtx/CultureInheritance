//
//  AllCardsVIew.swift
//  Inheritance
//
//  Created by 许智尧 on 2023/4/7.
//

import SwiftUI

struct CardView: View {
    
    //    var Items: [CultureInheritanceVM.Card]
    //    var content: (CultureInheritanceVM.Card) -> any View
    //
    //    init(Items: [CultureInheritanceVM.Card], content: @escaping (CultureInheritanceVM.Card) -> any View){
    //        self.Items = Items
    //        self.content = content
    //    }
    
//    private let card: CultureInheritance<Any>.CultureCard
    
    private let card: CultureInheritanceVM.Card
    
    
    init(_ givenCultureCard: CultureInheritance<CultureInheritanceVM.Content>.CultureCard){
        self.card = givenCultureCard
    }

    
    var body: some View {
        
        VStack {
            ZStack{
                Image(card.content.image)
                    .resizable()
                    .frame(width: 270, height: 150)
            }
            HStack {
                Text(card.content.title)
                    .bold()
                    .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            HStack {
                Text(card.content.origin)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
            }
//            HStack{
//                Text("\(card.content.existTime)")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                    .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//            }
            //                HStack {
            //                    ForEach(0 ..< trendingMeal.stars) { item in
            //                        Image(systemName: "star.fill")
            //                            .foregroundColor(.yellow)
            //                            .font(.subheadline)
            //                    }
            //                    Spacer()
            //
            //                    Text(trendingMeal.price)
            //                        .font(.subheadline)
            //                        .bold()
            //                }
            //                .padding(.bottom, 30)
            //                .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            //                .padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        .frame(width: 250, height: 250)
        .cornerRadius(10)
        
    }
}

//struct AllCardsVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
