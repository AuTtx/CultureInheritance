//
//  HomeNavigationView.swift
//  Inheritance
//
//  Created by 许智尧 on 2023/4/7.
//

import SwiftUI

struct HomeNavigationView: View {
    @State private var selection = 1
    @State var showAccount = false
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    
//    init(selection: Int = 1, Inher: CultureInheritanceVM) {
//        self.Inher = Inher
//        UITabBar.appearance().backgroundColor = .white
//    }
    var body: some View {
        
            TabView(selection: $selection) {
                HomeView().tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("首页")
                    }
                    
                }.tag(1)
                
                EmojiMemoryGameView(game : EmojiMemoryGameView.game1).tabItem {
                    VStack {
                        Image(systemName: "heart.fill")
                        Text("玩一玩")
                    }
                    
                }.tag(2)
                
                
                AccountView().tabItem {
                    VStack{
                        VStack {
                            Image(systemName: "person.fill")
                            Text("我")
                        }
                    }.tag(4)
                }
                
                ARContentView().tabItem{
                    VStack{
                        VStack{
                            Image(systemName: "viewfinder.circle.fill")
                            Text("AR体验")
                        }
                    }.tag(3)
                }
                
                
                
//                Button{
//                    showAccount = true
//                }label: {
//                    Text("Profile").tabItem {
//                        VStack {
//                            Image(systemName: "person.fill")
//                            Text("我")
//                        }
//                    }.tag(3)
//                        .sheet(isPresented: $showAccount){
//                            AccountView()
//                        }
//                }
                
                
            }
            .accentColor(.red)
        }
    }

struct HomeNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationView()
    }
}
