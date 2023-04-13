//
//  MusicContentView.swift
//  Inheritance
//
//  Created by 赵一田 on 2023/4/12.
//

import SwiftUI
import AVKit

struct MusicContentView: View {
    var body: some View {
        NavigationView{
            MusicPlayer().navigationTitle("Music Player")
        }
    }
}

struct MusicContentView_Previews: PreviewProvider {
    static var previews: some View {
        MusicContentView()
    }
}
