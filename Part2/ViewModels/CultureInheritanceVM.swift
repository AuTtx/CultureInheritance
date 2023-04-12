//
//  CultureInheritanceVM.swift
//  Inheritance
//
//  Created by 许智尧 on 2023/4/7.
//

import SwiftUI

class CultureInheritanceVM: ObservableObject{
    typealias Card = CultureInheritance<Content>.CultureCard
    
    struct Content{
        var title: String
        var image: String
        var Cateimage: String
        var descrip: String
        var origin: String
        var existTime: Int
        var videoURL: String
    }
    static var CultureData = [
        Content(title: "皮影戏", image: "皮影戏",Cateimage: "cate-pyx" ,descrip: "皮影戏从有文字记载，已经有1000多年的历史，汉武帝爱妃李夫人染疾故去了，武帝的思念心切神情恍惚，终日不理朝政。大臣李少翁一日出门，路遇孩童手拿布娃娃玩耍，影子倒映于地栩栩如生。李少翁心中一动，用棉帛裁成李夫人影像，涂上色彩，并在手脚处装上木杆。入夜围方帷，张灯烛，恭请皇帝端坐帐中观看。武帝看罢龙颜大悦，就此爱不释手。这个载入《汉书》的爱情故事，被认为是皮影戏最早的渊源", origin: "成熟于唐宋秦晋豫，极盛于清代河北", existTime: 1000, videoURL: "1"),
        Content(title: "京剧", image: "京剧",Cateimage: "cata-jj", descrip: "徽、秦、汉的合流,为京剧的诞生奠定了基础。道光二十年至咸丰十年(公元1840年—公元1860年),经徽戏、秦腔、汉调的合流,并借鉴吸收昆曲、京腔之长而形成了京剧。” ", origin: "分为生、旦、净、丑", existTime: 200, videoURL: "2"),
        Content(title: "剪纸", image: "123",Cateimage: "cate-jz", descrip: "纸的发明是在公元前的西汉时代，在此之前是不可能有剪纸艺术的出现的，但当时人们运用薄片材料，通过镂空雕刻的技法制成工艺品，却早在未出现纸时就已流行，即以雕、镂、剔、刻、剪的技法在金箔、皮革、绢帛，甚至在树叶上剪刻纹样。纸张出现后，促使了“剪纸”的诞生", origin: "代表作：《龙凤呈祥》、《凤凰戏牡丹》", existTime: 1500, videoURL: "3"),
        Content(title: "端午", image: "duanwujie", Cateimage: "cate-xhj", descrip: "端午节，起源于中国，最初是上古先民以龙舟竞渡形式祭祀龙祖的节日。因传说战国时期的楚国诗人屈原在端午抱石跳汨罗江自尽，后来人们亦将端午节作为纪念屈原的节日；个别地方也有纪念伍子胥、曹娥及介子推等说法。总的来说，端午节起源于江浙地区吴越部族的龙图腾祭祀，注入夏季时令祛病防疫风尚，把端午视为恶月恶日起于北方，附会纪念屈原等历史人物纪念内容，最后形成如今端午节文化内涵。", origin: "内含颇深：家国情怀、赤忱的爱", existTime: 2000, videoURL: "4"),
        Content(title: "篆刻", image: "zk", Cateimage: "cate-zk", descrip: "先秦。篆刻兴起于先秦，兴盛于汉，衰落于晋，失落于唐宋，复兴于明，复兴于清。距今已有3700多年的历史。篆刻，在起源至今3700多年的历史长河中，历经十余个朝代。在这个长期的发展过程中，篆刻艺术经历了两个高度发展的历史阶段。“篆刻”在中国的历史要晚于中国书画的历史。“篆刻”的艺术性萌芽于宋元时期，其目的是艺术，其创造者是文人，是艺术创作。", origin: "于方寸间施展技艺、抒发情感", existTime: 3700, videoURL: "5"),
        Content(title: "雕版印刷", image: "d4", Cateimage: "cate-db", descrip: "在隋末唐初，由于大规模的农民大起义，推动了社会生产的发展，文化事业也跟着繁荣起来，客观上产生了雕版印刷的迫切需要，促进了雕版印刷的产生。在唐朝时期，为了刻印佛经，印刷术逐渐得到普及", origin: "标志着隋末唐初的文化繁荣", existTime: 1400, videoURL: "6"),
        Content(title: "针灸", image: "zj", Cateimage: "cate-zj", descrip: "针灸医学最早见于二千年多前的《黄帝内经》一书。《黄帝内经》说：藏寒生满病，其治宜灸，便是指灸术，其中详细描述了九针的形制，并大量记述了针灸的理论与技术。两千多年来针灸疗法一直在中国流行，并传播到了世界。而针灸的出现，则更早。针灸分两部分，一是针具，一是灸法。在新石器时代，受伤的人偶然被一些坚硬物体如石头、荆棘碰到身体某个部位，会出现身体疼痛减轻的现象。于是，古人开始有意识地用一些锋利的石块来刺激这些身体部位，这就是最早的针具——砭石。灸法是伴随着火的使用而形成的。我们的祖先在用火中，发现躯体的某些病痛，受到火的熏烤或灼烧后有所缓解，在得到这样的启示后逐渐发明了灸法。", origin: "疏通经络、调和阴阳、扶正祛邪", existTime: 4000, videoURL: "7"),
        Content(title: "宣纸", image: "xz", Cateimage: "cate-xz", descrip: "唐天宝年间，在全国各地运到京城长安的进贡之物中，宣城郡船中有“纸、笔”等贡品，这说明当时宣城郡已生产纸、笔。宣纸是中国独特的手工艺品，具质地绵韧、光洁如玉、不蛀不腐、墨韵万变之特色，享有“千年寿纸”的美誉，被誉为“国宝”", origin: "质地绵韧、光洁如玉,墨韵万变之特色", existTime: 1500, videoURL: "8")
    ]
    
    private func createContent(CultureContentArray: Array<Content>, index: Int) ->Content{
        let tempContent = Content(title: CultureContentArray[index].title, image: CultureContentArray[index].image, Cateimage:  CultureContentArray[index].Cateimage, descrip: CultureContentArray[index].descrip, origin: CultureContentArray[index].origin, existTime: CultureContentArray[index].existTime, videoURL: CultureContentArray[index].videoURL)
        return tempContent
        
    }
    
    static func createCultureInheritance() -> CultureInheritance<Content>{
        CultureInheritance<Content>(numbersOfCultureCards: 8) { index in
            CultureData[index]
        }
    }
    
    @Published private  var model = createCultureInheritance()
    var CultureCards: Array<CultureInheritanceVM.Card>{
        return model.CultureCards
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
