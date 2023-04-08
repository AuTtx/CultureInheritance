//
//  detailedCultureView.swift
//  Inheritance
//
//  Created by 许智尧 on 2023/4/7.
//

import SwiftUI

struct detailedCultureView: View {
    
    private let card: CultureInheritanceVM.Card
    @State var heart = "heart.fill"
    var placeHolder = "这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案 "
    
    init(_ givenCultureCard: CultureInheritance<CultureInheritanceVM.Content>.CultureCard){
        self.card = givenCultureCard
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                GeometryReader{reader in
                    Image(card.content.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        
                        .offset(y: -reader.frame(in: .global).minY)
                        // going to add parallax effect....
                        .frame(width: UIScreen.main.bounds.width, height:  reader.frame(in: .global).minY + 300)
                    
                }
                .frame(height: 280)
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text(card.content.title)
                        .font(.system(size: 35, weight: .bold))
                    
                    
                    HStack(spacing: 10){
                        
                        ForEach(1..<5){_ in
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    
                    HStack {
                        Text(card.content.descrip)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.top,5)
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.spring(dampingFraction: 0.5)) {
                                heart = "heart"
                            }
                        }, label: {
                            Image(systemName: heart)
                                .font(.largeTitle)
                                .foregroundColor(.red)
                            
                        })
                        .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    
                    
                    Text("Description")
                        .font(.system(size: 25, weight: .bold))
                    
                    Text(placeHolder)
                        .padding(.top, 10)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.top, 25)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(20)
                .offset(y: -35)
            })
            
            
            Spacer()
            
//            HStack{
//                Spacer()
//                Button(action: {}, label: {
//                    Text("Add to Cart")
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .padding(.vertical, 10)
//                        .padding(.horizontal, 100)
//                        .background(Color.red)
//                        .cornerRadius(10)
//
//                })
//                Spacer()
//            }
//            .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//            .edgesIgnoringSafeArea(.all)
//            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
    
}
 

































//
//
//struct detailedCultureView_Previews: PreviewProvider {
//    static var previews: some View {
//        detailedCultureView()
//    }
//}
