//
//  OnBoardingView.swift
//  Inheritance
//
//  Created by 许智尧 on 2023/4/7.
//

import SwiftUI

struct OnBoardingView: View {
//    var Inher: CultureInheritanceVM
    init() {

        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
//    init(Inher: CultureInheritanceVM) {
//        self.Inher = Inher
//        UIPageControl.appearance().currentPageIndicatorTintColor = .red
//        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
//    }
    var body: some View {
        NavigationView { 
            pages()
        }
    }
}
    

    struct pages: View {
//        var Inher: CultureInheritanceVM
        var body: some View {
            VStack {
                TabView {
                    ForEach(Data) { page in
                        GeometryReader { g in
                            VStack {
                                Image(page.image)
                                    .resizable()
                                    .scaledToFit()
                                //                                .aspectRatio(contentMode: .fill)
                                //                                .ignoresSafeArea(.all,edges: .all)
                                Text(page.title)
                                    .font(.title).bold()
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 10)
                                Text(page.descrip)
                                    .multilineTextAlignment(.center)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            }
                            //                        .opacity(Double(g.frame(in : .global).minX)/200+1)
                        }
                    }
                }
                .ignoresSafeArea(.all,edges: .all)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
                //click on the start,and jump to 'location'view
                NavigationLink(
                    destination: Location().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                    label: {
                        Text("Start")
                            .font(.headline)
                            .frame(width: 200, height: 40, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                            .cornerRadius(10)
                    })
                Spacer()
            }
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: Location().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                                        label: {
                                            VStack{
                                                Image(systemName: "arrow.right")
                                                    .font(Font.system(.title3))
                                                    .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                                                Text("skip")
                                                    .multilineTextAlignment(.center)
                                                    .foregroundColor(.white)
                                                
                                            }
                                            
                                        })
            )
            .navigationBarBackButtonHidden(true)
        }
    }


    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
