//
//  TableViewData.swift
//  ExpandableMenuOrAccordion
//
//  Created by Nitin Bhatia on 09/08/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import Foundation

//struct to hold item data
struct item{
    var name : String
    
    init(name : String){
        self.name = name
    }
}

//struct to hold header item data
struct Section{
    var name : String
    var item : [item]
    var is_collapsed : Bool
    init(name : String,item:[item],collapsed:Bool){
        self.name = name
        self.item = item
        self.is_collapsed = collapsed
    }
}

//setting whole header and item in per header 
var sectionData : [Section] = [
    
    Section(name: "Section 1",
            item: [item(name: "item 1"),item(name: "item 1.2"),item(name: "item 1.3")
        ], collapsed: true),
    Section(name: "Section 2",
            item: [item(name: "item 2"),item(name: "item 2.1"),item(name: "item 2.2")
        ], collapsed: true),
    Section(name: "Section 3",
            item: [item(name: "item 3"),item(name: "item 3.1"),item(name: "item 3.2")
        ], collapsed: true),
    Section(name: "",
            item: [item(name:"item 4")], collapsed: false)

  
    
]
