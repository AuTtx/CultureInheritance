//
//  CultureInheritanceVM.swift
//  Inheritance
//
//  Created by 许智尧 on 2023/4/7.
//

import SwiftUI

class CultureInheritanceVM{
    typealias Card = CultureInheritance<Content>.CultureCard
    
    struct Content{
        var title: String
        var image: String
        var descrip: String
        var existTime: Int
        var videoURL: String
    }
    static var CultureData = [
            Content(title: "皮影戏", image: "皮影戏", descrip: "皮影戏从有文字记载，已经有1000多年的历史，汉武帝爱妃李夫人染疾故去了，武帝的思念心切神情恍惚，终日不理朝政。大臣李少翁一日出门，路遇孩童手拿布娃娃玩耍，影子倒映于地栩栩如生。李少翁心中一动，用棉帛裁成李夫人影像，涂上色彩，并在手脚处装上木杆。入夜围方帷，张灯烛，恭请皇帝端坐帐中观看。武帝看罢龙颜大悦，就此爱不释手。这个载入《汉书》的爱情故事，被认为是皮影戏最早的渊源", existTime: 1000, videoURL: "1"),
            Content(title: "京剧", image: "京剧", descrip: "徽、秦、汉的合流,为京剧的诞生奠定了基础。道光二十年至咸丰十年(公元1840年—公元1860年),经徽戏、秦腔、汉调的合流,并借鉴吸收昆曲、京腔之长而形成了京剧。” ", existTime: 2, videoURL: "2"),
            Content(title: "剪纸", image: "123", descrip: "纸的发明是在公元前的西汉时代，在此之前是不可能有剪纸艺术的出现的，但当时人们运用薄片材料，通过镂空雕刻的技法制成工艺品，却早在未出现纸时就已流行，即以雕、镂、剔、刻、剪的技法在金箔、皮革、绢帛，甚至在树叶上剪刻纹样。纸张出现后，促使了“剪纸”的诞生", existTime: 3, videoURL: "3")
    ]
    
    private func createContent(CultureContentArray: Array<Content>, index: Int) ->Content{
        let tempContent = Content(title: CultureContentArray[index].title, image: CultureContentArray[index].image, descrip: CultureContentArray[index].descrip, existTime: CultureContentArray[index].existTime, videoURL: CultureContentArray[index].videoURL)
        return tempContent
        
    }
    
    static func createCultureInheritance() -> CultureInheritance<Content>{
        CultureInheritance<Content>(numbersOfCultureCards: 3) { index in
            CultureData[index]
        }
    }
    
    @Published private  var model = createCultureInheritance()
    var CultureCards: Array<CultureInheritanceVM.Card>{
        return model.CultureCards
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
