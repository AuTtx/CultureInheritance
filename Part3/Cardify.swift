//
//  Cardify.swift
//  lec01
//
//  Created by 许智尧 on 2023/4/9.
//

import SwiftUI


struct Cardify: AnimatableModifier{
    
    var animatableData: Double{
        get{ rotation}
        set{ rotation = newValue}
    }
    
    var rotation: Double //in degrees
    
    init(isFacedUp: Bool){
        rotation = isFacedUp ? 0 : 180
    }
    
    func body(content: Content) -> some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if rotation < 90{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
            }
            else{
                shape.fill(Color.black.opacity(0)).background(
                    Image("whu")
                        .resizable()
                        .scaledToFit()
                )
                    
            }
            content
                .opacity((rotation < 90) ? 1 : 0)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }

    private struct  DrawingConstants{
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale:CGFloat = 0.8
    }
}

extension View{
    func cardify(isFacedUp: Bool) -> some View{
          self.modifier(Cardify(isFacedUp: isFacedUp))
    }
}
