//
//  MyCategoriesView.swift
//  Inheritance
//
//  Created by 许智尧 on 2023/4/8.
//

import SwiftUI

struct MyCategoriesView: View {
    @State var Inheritance = CultureInheritanceVM()
    private let card: CultureInheritance<CultureInheritanceVM.Content>.CultureCard
    
    init(_ givencard: CultureInheritance<CultureInheritanceVM.Content>.CultureCard) {
        self.card = givencard
    }
    
    var body: some View {
            VStack{
                NavigationLink(destination: detailedCultureView(card), label:{
                    ZStack{
                        Image(card.content.image)
                            .resizable()
                    }
                })
                Text(card.content.title)
                    .font(.subheadline)
                    .bold()
    //                .font(font(in: geometry.size))
            }
            .frame(width: 80, height: 90, alignment: .center)
            .background(.brown).opacity(0.6)
            .cornerRadius(15)
            }
        }


struct MyCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        MyCategoriesView(HomeView.Inheritance.CultureCards[0])
    }
}
