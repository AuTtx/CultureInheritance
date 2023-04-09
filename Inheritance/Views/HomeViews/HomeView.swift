//
//  HomeView.swift
//  Inheritance
//
//  Created by 许智尧 on 2023/4/7.
//

import SwiftUI

struct HomeView: View {
    @State var hero = false
    @ObservedObject static var Inheritance = CultureInheritanceVM()
//    @State public var Inheritance = CultureInheritanceVM()
    
    var body: some View {
        
        VStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    SearchBar()
                    VStack{
                        HStack {
                            Text("精选")
                                .bold()
                                .multilineTextAlignment(.trailing)
                                .padding(.leading, 40)
                            Spacer()
                            Text("查看所有 >")
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                                .padding(.trailing, 40)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Spacer()
                                ForEach(HomeView.Inheritance.CultureCards) { card in
                                    NavigationLink(
                                        destination: detailedCultureView(card),
                                        label: {
                                            Spacer()
                                            CardView(card)
                                                .background(Color.white)
                                                .cornerRadius(15)
                                                .shadow(radius: 1)
                                        })
                                    .buttonStyle(PlainButtonStyle())
                                }
                                .padding(.bottom, 20)
                                .padding(.leading, 40)
                            }
                        }
                    }.padding(.top, -70)
                    .opacity(self.hero ? 0 : 1)
                    
                    //Categories:xzy
                    VStack{
                        HStack {
//                            Spacer()
                            Text("Categories")
                                .bold()
                                .padding(.leading, 40)
                            //                                .multilineTextAlignment(.trailing)
                            //                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        
                        // Categories View
                        HStack{
                            LazyVGrid(columns:[GridItem(.adaptive(minimum: 80))],spacing: 10){
                                ForEach(HomeView.Inheritance.CultureCards)  { card in
                                    NavigationLink(destination: detailedCultureView(card),label: {
                                        MyCategoriesView(card)
                                    })
                                    
                                }
                            }.padding(.leading, 40)
                                .padding(.trailing, 40)
                        }
                    }
                .shadow(radius: 1)
                .opacity(self.hero ? 0 : 1)
                
//                Spacer(minLength: 30)
                //Our Picks
                    VStack{
                        HStack {
                            Text("非遗卡片集")
                                .bold()
                                .multilineTextAlignment(.trailing)
                                .padding(.leading, 40)
                            
                            Spacer()
//                            Text("查看所有 —>")
//                                .multilineTextAlignment(.leading)
//                                .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
//                                .padding(.trailing, 40)
                        }
                        .opacity(self.hero ? 0 : 1)
                        
                        
                        
                        
                        //cardview
//                        ScrollView{
                            Spacer(minLength: 35)
                            VStack(spacing: 100){
                                ForEach(HomeView.Inheritance.CultureCards)  { card in
                                    NavigationLink(destination: detailedCultureView(card),label: {
                                        PicksCardView(card)
                                    })
                                }
                            }
//                        }
                    }.padding(.top, 50)
                    .padding(.bottom, 50)

//                    Spacer()
                    
                    NavigationLink(
                        destination: Location().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                        label: {
                            HStack {
                                Image(systemName: "location.fill")
                                    .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                                
                                Text("和GPT聊一聊，了解更多")
                                    .bold()
                                    .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                            }
                            .frame(width: 300, height: 60, alignment: .center)
                            .border(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)), width: 3)
                            .cornerRadius(5)
                            .padding(.bottom, 40)
                        })
                }.background(Color(#colorLiteral(red: 0.9843164086, green: 0.9843164086, blue: 0.9843164086, alpha: 1)))
                
               
            }.background(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                .edgesIgnoringSafeArea(.top)
            
            
           
            
            
        }
        
    }
    
    
}








struct SearchBar: View {
    @State var search = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)), Color(#colorLiteral(red: 0.9843164086, green: 0.9843164086, blue: 0.9843164086, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                .frame(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height)*0.25, alignment: .center)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Browse")
                        .bold()
                        .font(.title)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.white)
                        .padding(.leading, 40)
                        .padding(.top, -40)
                    Spacer()
                    Text("Filter")
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding(.trailing, 40)
                        .padding(.top, -30)
                }
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .font(.title)
                    TextField("Search...", text: $search)
                        
                        .font(.title3)
                }
                .frame(width:  ( UIScreen.main.bounds.width)*0.85, height: 40, alignment: .leading)
                .padding(.leading, 20)
                .background(Color.white)
                .cornerRadius(10)
            }
        }
    }
}
























struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
//        let Inher = CultureInheritanceVM()
        HomeView()
    }
}
