//
//  HomeNavigationView.swift
//  Inheritance
//
//  Created by 许智尧 on 2023/4/7.
//

import SwiftUI

struct HomeNavigationView: View {
    @State private var selection = 1
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
                
                FavorsView().tabItem {
                    VStack {
                        Image(systemName: "heart.fill")
                        Text("关注")
                    }
                    
                }.tag(2)
                
                Text("Profile").tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("我")
                    }
                }.tag(3)
            }
            .accentColor(.red)
        }
    }

struct HomeNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationView()
    }
}
