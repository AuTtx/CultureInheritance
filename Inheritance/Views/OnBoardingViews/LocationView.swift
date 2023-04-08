//
//  LocationView.swift
//  Inheritance
//
//  Created by 许智尧 on 2023/4/7.
//

import SwiftUI

struct Location: View {
//    var Inher: CultureInheritanceVM
    var body: some View {
        NavigationView {
            VStack {
                Image("location")
                    .resizable()
                    .scaledToFit()
                Text("Hi, nice to meet you !")
                    .font(.title)
                    .bold()
                Text("Choose your location to find \nrestraurants around you. ")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                    .padding(.all, 20)
                
                NavigationLink(
                    destination: HomeNavigationView().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                    label: {
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                            
                            Text("Use current location")
                                .bold()
                                .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                            
                        }
                        .frame(width: 300, height: 60, alignment: .center)
                        .border(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)), width: 3)
                        .cornerRadius(5)
                    })
                
                Text("Select Manually")
                    .bold()
                    .underline()
                    .foregroundColor(.gray)
                    .padding(.top, 80)
                Spacer()
                
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    var Inher: CultureInheritanceVM
    static var previews: some View {
        Location()
    }
}
