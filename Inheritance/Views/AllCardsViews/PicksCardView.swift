//
//  PicksCardView.swift
//  Inheritance
//
//  Created by 许智尧 on 2023/4/8.
//

import SwiftUI

struct PicksCardView: View {
    private let card: CultureInheritanceVM.Card
    
    
    init(_ givenCultureCard: CultureInheritance<CultureInheritanceVM.Content>.CultureCard){
        self.card = givenCultureCard
    }

    
    var body: some View {
        
        VStack {
            ZStack{
                Image(card.content.image)
                        .resizable()
                        .frame(width: (UIScreen.main.bounds.width)*0.9 , height: (UIScreen.main.bounds.height)*0.3)
                        .cornerRadius(20)
            }
            HStack {
                Text(card.content.title)
                    .bold()
                    .padding(.leading, 10)
                    .foregroundColor(.black)
            }
            
            HStack {
                Text(card.content.origin)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.leading, 55)
                Spacer()
            }
            Spacer()
            HStack{
                Text("已传承")
                Text("\(card.content.existTime)多年")
                    .font(.subheadline)
                    .foregroundColor(.yellow)
                    .bold()
                Image(systemName: "timer.square")
            }
            .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        .frame(width: 450, height: 300)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
        
    }
}

//struct PicksCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PicksCardView()
//    }
//}
