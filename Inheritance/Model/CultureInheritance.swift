//
//  CultureCard.swift
//  Inheritance
//
//  Created by 许智尧 on 2023/4/7.
//

import Foundation


struct CultureInheritance<ContentType>{
    private(set) var CultureCards: Array<CultureCard>
    
    func choose(){
        
    }
    init(numbersOfCultureCards: Int, createCardContent:(Int)-> CultureInheritanceVM.Content){
        CultureCards = []
        for index in 0..<numbersOfCultureCards{
            let content = createCardContent(index)
            CultureCards.append(CultureCard(id: index, content: content))
        }
        
    }
    
    
    
    
    
    
    struct CultureCard: Identifiable{
        var id: Int
        var isFavourite: Bool = false
        var content: CultureInheritanceVM.Content
        var expand: Bool = false
    }
}

