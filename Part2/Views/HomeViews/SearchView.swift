//
//  SearchView.swift
//  Inheritance
//
//  Created by 赵一田 on 2023/4/9.
//

import SwiftUI

struct SearchView: View {
    /**
     @State var text = ""
     @Environment(\.presentationMode) var presentationMode
     
     var body: some View {
     NavigationView{
     List(0..<5){item in
     Text("hello")
     }
     //List{
     //Foreach(course.filter{$0.title.contains(tetx) || text ==""}) {item in Text(item.title)}
     //
     //}
     .searchable(text: $text,placement:
     .navigationBarDrawer(displayMode: .always),prompt:
     Text("1,2,3"))
     .navigationTitle("search")
     .navigationBarTitleDisplayMode(.inline)
     .navigationBarItems(trailing: Button{presentationMode.wrappedValue.dismiss()} label:{Text("Done").bold() } )
     }
     }
     
     */
    @State var text = ""
    @State var showCourse = false
    //    @State var selectedCourse = courses[0]
    @Namespace var namespace
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                content
                .navigationBarItems(trailing: Button{presentationMode.wrappedValue.dismiss()} label:{Text("Done").bold() } )
            }
        }
        .searchable(text: $text) {
            ForEach(suggestions) { suggestion in
                Button {
                    text = suggestion.text
                } label: {
                    Text(suggestion.text)
                }
                .searchCompletion(suggestion.text)
                
            }
        }
    }
    
    var content: some View {
        NavigationView{
//            List(0..<1){item in
//                            }
            //List{
            //Foreach(course.filter{$0.title.contains(tetx) || text ==""}) {item in Text(item.title)}
            //
            //}
            
//            .searchable(text: $text,placement:
//                    .navigationBarDrawer(displayMode: .always),prompt:
//                            Text("1,2,3"))
//            .navigationTitle("search")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarItems(trailing: Button{presentationMode.wrappedValue.dismiss()} label:{Text("Done").bold() } )
        }
    }
    
    var suggestions: [Suggestion] {
        if text.isEmpty {
            return suggestionsData
        } else {
            return suggestionsData.filter { $0.text.contains(text) }
        }
    }
    
    struct Suggestion: Identifiable {
        let id = UUID()
        var text: String
    }
    
    var suggestionsData = [
        Suggestion(text: "SwiftUI"),
        Suggestion(text: "Flutter"),
        Suggestion(text: "Design"),
        Suggestion(text: "React")
    ]
    
    
    struct SearchView_Previews: PreviewProvider {
        static var previews: some View {
            SearchView()
        }
    }
    
}
